<?php
/**
 * Plugin Name: List table
 */

if (!class_exists('WP_List_Table')) {
    require_once ABSPATH . 'wp-admin/includes/class-wp-list-table.php';
}

class Proposed_News_List extends WP_List_Table
{
    public function __construct()
    {

        parent::__construct([
            'singular' => __('News', 'sp'), //singular name of the listed records
            'plural' => __('News', 'sp'), //plural name of the listed records
            'ajax' => false,

        ]);
    }
    
    public static function get_news($per_page = 5, $page_number = 1)
    {

        global $wpdb;

        $sql = "SELECT * FROM {$wpdb->prefix}proposed_news";

        if (!empty($_REQUEST['orderby'])) {
            $sql .= ' ORDER BY ' . esc_sql($_REQUEST['orderby']);
            $sql .= !empty($_REQUEST['order']) ? ' ' . esc_sql($_REQUEST['order']) : ' ASC';
        }

        $sql .= " LIMIT $per_page";

        $sql .= ' OFFSET ' . ($page_number - 1) * $per_page;

        $result = $wpdb->get_results($sql, 'ARRAY_A');

        return $result;
    }

    public static function delete_news($id)
    {
        global $wpdb;

        $wpdb->delete(
            "{$wpdb->prefix}proposed_news",
            ['ID' => $id],
            ['%d']
        );
    }

    public static function record_count()
    {
        global $wpdb;

        $sql = "SELECT COUNT(*) FROM {$wpdb->prefix}proposed_news";

        return $wpdb->get_var($sql);
    }

    public function column_name($item)
    {

        // create a nonce
        $delete_nonce = wp_create_nonce('sp_delete_news');

        $title = '<strong>' . $item['name'] . '</strong>';

        $actions = [
            'delete' => sprintf('<a href="?page=%s&action=%s&id=%d&_wpnonce=%s">Delete</a>', esc_attr($_REQUEST['page']), 'delete', absint($item['id']), $delete_nonce),
        ];

        return $title . $this->row_actions($actions);
    }

    public function no_items()
    {
        _e('No news avaliable.', 'sp');
    }

    public function column_default($item, $column_name)
    {
        switch ($column_name) {
            case 'id':
            case 'name':
            case 'email':
            case 'topic':
            case 'meta':
            case 'category':
            case 'file_name':
            case 'data_created':
                return $item[$column_name];
            default:
                return print_r($item, true);
        }
    }

    public function column_cb($item)
    {
        return sprintf(
            '<input type="checkbox" name="bulk-delete[]" value="%s" />', $item['id']
        );
    }

    public function get_columns()
    {
        $columns = [
            'cb' => '<input type="checkbox" />',
            'name' => __('Name', 'sp'),
            'email' => __('email', 'sp'),
            'topic' => __('topic', 'sp'),
            'meta' => __('meta', 'sp'),
            'category' => __('category', 'sp'),
            'file_name' => __('file_name', 'sp'),
            'data_created' => __('data_created', 'sp'),
        ];

        return $columns;
    }

    public function get_sortable_columns()
    {
        $sortable_columns = array(
            'name' => array('name', true),
            'category' => array('category', true),
            'file_created' => array('file_created', true),
        );

        return $sortable_columns;
    }

    public function get_bulk_actions()
    {
        $actions = array(
            'bulk-delete' => 'Delete',
            'bult-edit' => 'Edit',
        );

        return $actions;
    }

    public function prepare_items()
    {

        $this->_column_headers = $this->get_column_info();

        /** Process bulk action */
        $this->process_bulk_action();

        $per_page = $this->get_items_per_page('news_per_page', 5);
        $current_page = $this->get_pagenum();
        $total_items = self::record_count();

        $this->set_pagination_args([
            'total_items' => $total_items, //WE have to calculate the total number of items
            'per_page' => $per_page, //WE have to determine how many items to show on a page
        ]);

        $this->items = self::get_news($per_page, $current_page);
    }

    public function process_bulk_action()
    {
        //Detect when a bulk action is being triggered...
        if ('delete' === $this->current_action()) {

            // In our file that handles the request, verify the nonce.
            $nonce = esc_attr($_REQUEST['_wpnonce']);

            if (!wp_verify_nonce($nonce, 'sp_delete_news')) {
                wp_die(__('Error in deleting.'));
            } else {
                self::delete_news(absint($_GET['id']));
                wp_redirect(esc_url( add_query_arg() ));
                exit;
            }

        }
        
        if ((isset($_POST['action']) && $_POST['action'] == 'bulk-delete')
        || (isset($_POST['action2']) && $_POST['action2'] == 'bulk-delete')
        ) {
            $delete_ids = esc_sql($_POST['bulk-delete']);
            
            foreach ($delete_ids as $id) {
                self::delete_news($id);
            }
            wp_redirect(esc_url( add_query_arg() ));
            exit;
        }
    }
}

class SP_Plugin
{

    // class instance
    static $instance;

    // customer WP_List_Table object
    public $news_obj;

    // class constructor
    public function __construct()
    {
        add_filter('set-screen-option', [__CLASS__, 'set_screen'], 10, 3);
        add_action('admin_menu', [$this, 'plugin_menu']);
    }
    public static function set_screen($status, $option, $value)
    {
        return $value;
    }

    public function plugin_menu()
    {

        $hook = add_menu_page(
            'Sitepoint WP_List_Table Example',
            'SP WP_List_Table',
            'manage_options',
            'wp_list_table_class',
            [$this, 'plugin_settings_page']
        );

        add_action("load-$hook", [$this, 'screen_option']);

    }

    public function screen_option()
    {

        $option = 'per_page';
        $args = [
            'label' => 'News',
            'default' => 5,
            'option' => 'news_per_page',
        ];

        add_screen_option($option, $args);

        $this->news_obj = new Proposed_News_List();
    }

    public function plugin_settings_page()
    {
        ?>
            <div class="wrap">
                <h2>WP_List_Table Class Example</h2>
                <div id="poststuff">
                    <div id="post-body" class="metabox-holder columns-2">
                        <div id="post-body-content">
                            <div class="meta-box-sortables ui-sortable">
                                <form method="post">
                                    <?php
                                        $this->news_obj->prepare_items();
                                        $this->news_obj->display();
                                    ?>
                                </form>
                            </div>
                        </div>
                    </div>
                    <br class="clear">
                </div>
            </div>
        <?php
}
    public static function get_instance()
    {
        if (!isset(self::$instance)) {
            self::$instance = new self();
        }

        return self::$instance;
    }
}

function app_output_buffer() {
      ob_start();
}
add_action('init', 'app_output_buffer');

add_action('plugins_loaded', function () {
    SP_Plugin::get_instance();
});