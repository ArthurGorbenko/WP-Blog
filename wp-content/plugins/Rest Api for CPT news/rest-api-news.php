<?php
/**
 * Plugin Name: Rest api for news
 */

class Rest_Controller_News
{
    public function register_routes()
    {
        $version = '1';
        $namespace = 'news/v' . $version;
        register_rest_route($namespace, '/published', array(
            array(
                'methods' => WP_REST_Server::READABLE,
                'callback' => array($this, 'get_news'),
            ),
            array(
                'methods' => WP_REST_Server::CREATABLE,
                'callback' => array($this, 'create_news'),
            ),
        ));
        register_rest_route($namespace, '/published/(?P<id>[\d]+)', array(
            array(
                'methods' => WP_REST_Server::READABLE,
                'callback' => array($this, 'get_single_news'),

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
        $ID = store_news_data($_POST);
        attach_file_to_news('media', $ID);
        $created_news = get_post($ID);
        return new WP_REST_Response($created_news, 200);
    }

    public function get_single_news($request)
    {
        $id = $request['id'];
        $item = get_post($id);
        if (!$item) {
            return new WP_REST_Response('The post is not exists', 404);
        }
        $data = $item->to_array();
        $meta_keys = array('author_email', 'author_name', 'category', '_thumbnail_id');
        $meta_data = array();
        foreach ($meta_keys as $key) {
            $meta_data[$key] = get_post_meta($item->ID, $key)[0];
        }
        $data = $item->to_array() + $meta_data;
        $data['attachment_url'] = wp_get_attachment_url($item->_thumbnail_id);
        return new WP_REST_Response($data, 200);
    }

}

function prefix_register_my_rest_routes()
{
    $controller = new Rest_Controller_News();
    $controller->register_routes();
}

add_action('rest_api_init', 'prefix_register_my_rest_routes');