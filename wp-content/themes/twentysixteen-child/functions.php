<?php
add_action('wp_enqueue_scripts', 'my_theme_enqueue_styles');
function my_theme_enqueue_styles()
{
    wp_enqueue_style('parent-style', get_template_directory_uri() . '/style.css');

}
function store_news_data($post_data)
{
    $new_post = array(
        'post_title' => $post_data['topic'],
        'post_content' => $post_data['meta'],
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

function attach_file_to_news($file, $news_ID)
{
    require_once ABSPATH . 'wp-admin/includes/image.php';
    require_once ABSPATH . 'wp-admin/includes/file.php';
    require_once ABSPATH . 'wp-admin/includes/media.php';

    $attachment_id = media_handle_upload($file, $news_ID);
    set_post_thumbnail($news_ID, $attachment_id);
    if (is_wp_error($attachment_id)) {
        return "Error";
    }
    return $attachment_id;
}

function send_news_to_admin()
{

    $news_id = store_news_data($_POST);
    attach_file_to_news('file', $news_id);
    if (wp_redirect("your-message-has-been-sent-successfully")) {
        exit;
    }
    return $news_id;
}
add_action("admin_post_nopriv_news_form", "send_news_to_admin");
add_action("admin_post_news_form", "send_news_to_admin");

//Add custom posts type 'news'
add_action('init', 'news');

function news()
{
    $labels = array(
        'name' => 'news',
        'singular_name' => 'news',
        'edit_item' => 'Edit news',
        'all_items' => 'All news',
        'view_item' => 'View news',
        'search_items' => 'Search news',
        'not_found' => 'News not found.',
        'show_in_rest' => true,
        'not_found_in_trash' => 'News not found in trash',
        'menu_name' => 'Proposed News',
    );
    $args = array(
        'labels' => $labels,
        'public' => true,
        'menu_icon' => 'dashicons-buddicons-pm',
        'menu_position' => 5,
        'has_archive' => true,
        'supports' => array('title', 'editor', 'excerpt', 'thumbnail', 'custom_fields'),
    );
    register_post_type('news', $args);
}

add_filter('manage_news_posts_columns', 'set_custom_edit_news_columns');

function set_custom_edit_news_columns($columns)
{
    $columns['author_name'] = __('Author name', 'localhost');
    $columns['author_email'] = __('Author email', 'localhost');
    $columns['featured_image'] = __('Featured image', 'localhost');
    $columns['content'] = __('Content', 'localhost');
    return $columns;
}

//Add custom image size
add_theme_support('post-thumbnails');
add_image_size('small', 150, 150);

//Get data for custom columns
add_action('manage_news_posts_custom_column', 'news_columns_content', 10, 2);

function news_columns_content($column_name, $news_ID)
{
    switch ($column_name) {
        case 'featured_image':
            $post_featured_image = get_thumbnail_of_attachment($news_ID);
            if ($post_featured_image) {
                echo the_post_thumbnail('small');
            }
            break;
        case 'content':
            $post = get_post($news_ID);
            if ($post->post_content) {
                echo '<p>' . $post->post_content . '</p>';
            }
            break;
        case 'author_email':
            $meta_email = get_post_meta($news_ID, 'author_email', true);
            if ($meta_email) {
                echo '<p>' . $meta_email . '</p>';
            }
            break;
        case 'author_name':
            $meta_name = get_post_meta($news_ID, 'author_name', true);
            if ($meta_name) {
                echo '<p>' . $meta_name . '</p>';
            }
            break;
        default:return $news_ID;
    }
}

function get_thumbnail_of_attachment($news_ID)
{
    if (get_the_post_thumbnail_url($news_ID)) {
        return get_the_post_thumbnail_url($news_ID, 'post-news');
    }
    $result = get_posts(array(
        'post_type' => 'attachment',
        'post_parent' => $news_ID,
    ));
    if (is_array($result) && isset($result[0]->ID)) {
        $ID = $result[0]->ID;
        return wp_get_attachment_thumb_url($ID);
    } else {
        return 'Image does not set';
    }
}
//fix mail error with unavailable link
add_filter("retrieve_password_message", "mapp_custom_password_reset", 99, 4);

function mapp_custom_password_reset($message, $key, $user_login, $user_data)
{

    $message = "Someone has requested a password reset for the following account:

" . sprintf(__('%s'), $user_data->user_email) . "

If this was a mistake, just ignore this email and nothing will happen.

To reset your password, visit the following address:

" . network_site_url("wp-login.php?action=rp&key=$key&login=" . rawurlencode($user_login), 'login') . "\r\n";

    return $message;

}

add_filter('show_password_fields', '__return_true', 999);
?>