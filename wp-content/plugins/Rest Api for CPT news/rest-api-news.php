<?php
/**
 * Plugin Name: Rest api for news
 */

class Rest_Controller_News
{
    public function register_routes()
    {
        $version = '1';
        $non_auth_namespace = 'news/v' . $version;
        register_rest_route($non_auth_namespace, '/published', array(
            array(
                'methods' => WP_REST_Server::READABLE,
                'callback' => array($this, 'get_news'),

            ),
            array(
                'methods' => WP_REST_Server::CREATABLE,
                'callback' => array($this, 'create_news'),
            ),
        ));
        register_rest_route($non_auth_namespace, '/user', array(
            array(
                'methods' => WP_REST_Server::CREATABLE,
                'callback' => array($this, 'register_user'),
            ),
        ));
        $auth_required_namespace = '/jwt-auth/v1/' . $non_auth_namespace;
        register_rest_route($auth_required_namespace, '/published/(?P<ID>[\d]+)', array(
            array(
                'methods' => WP_REST_Server::READABLE,
                'callback' => array($this, 'get_single_news'),
                'permission_callback' => function ($request) {
                    return is_user_logged_in();
                },

            ),
            array(
                'methods' => WP_REST_Server::EDITABLE,
                'callback' => array($this, 'edit_news'),
                'permission_callback' => function ($request) {
                    return is_user_logged_in();
                },
            ),
            array(
                'methods' => WP_REST_Server::DELETABLE,
                'callback' => array($this, 'delete_news'),
                'permission_callback' => function ($request) {
                    return is_user_logged_in();
                },
            )));
    }

    public function get_news($request)
    {
        $items = get_posts(array(
            'numberposts' => 10,
            'post_type' => 'news',
        )
        );
        $data = $items;
        $index = 0;
        $meta_keys = array('author_email', 'author_name', 'category', '_thumbnail_id');
        foreach ($items as $item) {
            $meta_data = array();
            foreach ($meta_keys as $key) {
                $meta_data[$key] = get_post_meta($item->ID, $key)[0];
            }
            $new_item = $item->to_array() + $meta_data;
            $new_item['attachment_url'] = wp_get_attachment_url($item->_thumbnail_id);
            $data[$index] = $new_item;
            $index++;
        }
        return new WP_REST_Response($data, 200);
    }

    public function create_news($request)
    {
        $params = $request->get_params();
        $ID = $this->store_news_data($_POST);
        $this->attach_file_to_news('file', $ID);
        $created_news = get_post($ID);
        return new WP_REST_Response($created_news, 200);
    }

    public function register_user($request)
    {
        $user_data = $request->get_body_params();
        $ID;
        if (isset($user_data['username']) && isset($user_data['password']) && isset($user_data['email'])) {
            $ID = wp_insert_user(array(
                'user_pass' => $user_data['password'],
                'user_login' => $user_data['username'],
                'email' => $user_data['email'],
            ));
            return new WP_REST_Response($ID, 200);
        }
        return new WP_REST_Response($ID,200);

    }

    public function store_news_data($post_data)
    {
        $new_post = array(
            'post_title' => $post_data['topic'],
            'post_content' => $post_data['message'],
            'post_status' => 'pending',
            'post_type' => 'news',
        );
        $news_id = wp_insert_post($new_post, true);
        $meta_data = array(
            'author_name' => $post_data['name'],
            'category' => $post_data['category'],
            'author_email' => $post_data['email'],
        );
        foreach ($meta_data as $key => $value) {
            update_post_meta($news_id, $key, $value);
        }
        return $news_id;
    }
    public function attach_file_to_news($file, $news_ID)
    {
        require_once ABSPATH . 'wp-admin/includes/image.php';
        require_once ABSPATH . 'wp-admin/includes/file.php';
        require_once ABSPATH . 'wp-admin/includes/media.php';

        $attachment_id = media_handle_upload($file, $news_ID);
        set_post_thumbnail($news_ID, $attachment_id);
        if (is_wp_error($attachment_id)) {
            echo "Error";
        } else {
            echo "Success.";
        }
        return $attachment_id;
    }

    public function get_item($ID)
    {
        $item = get_post($ID);
        if (!isset($item)) {
            return 'Invalid ID';
        }
        $data = $item->to_array();
        $filtered_data = array_filter($data, function ($key) {
            if ($key === 'ID' || $key === 'post_content' || $key === 'post_title') {
                return true;
            } else {
                return false;
            }
        }, ARRAY_FILTER_USE_KEY);
        $meta_keys = array('author_email', 'author_name', 'category', '_thumbnail_id');
        $meta_data = array();
        foreach ($meta_keys as $key) {
            $meta_data[$key] = get_post_meta($item->ID, $key)[0];
        }
        $filtered_data += $meta_data;
        $filtered_data['attachment_url'] = wp_get_attachment_url($item->_thumbnail_id);
        return $filtered_data;

    }

    public function get_single_news($request)
    {
        $ID = $request['ID'];
        $result = $this->get_item($ID);
        if ($result === 'Invalid ID') {
            return new WP_REST_Response($result, 404);
        }
        return new WP_REST_Response($result, 200);
    }

    public function edit_news($request)
    {
        $args = array(
            "ID" => $request['ID'],
            "post_title" => $request['topic'],
            "post_content" => $request['message'],
        );
        $ID = wp_update_post($args);
        $meta_data = array(
            'author_name' => $request['name'],
            'category' => $request['category'],
            'author_email' => $request['email'],
        );
        foreach ($meta_data as $key => $value) {
            update_post_meta($ID, $key, $value);
        }
        $id_attachment = get_post_thumbnail_id($ID);
        wp_delete_attachment($id_attachment, true);
        attach_file_to_news('file', $ID);
        $new_post = get_post($ID);
        return new WP_REST_Response($new_post, 200);
    }

    public function delete_news($request)
    {
        $ID = $request['ID'];
        $id_attachment = get_post_thumbnail_id($ID);
        wp_delete_attachment($id_attachment, true);
        $result = wp_delete_post($ID, true);
        return new WP_REST_Response($result, 200);
    }

}

function prefix_register_my_rest_routes()
{
    $controller = new Rest_Controller_News();
    $controller->register_routes();
}

add_action('rest_api_init', 'prefix_register_my_rest_routes');