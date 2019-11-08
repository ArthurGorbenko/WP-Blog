<?php
ob_start();
include_once get_template_directory() . '/admin/customizer.php';

/**
 * uncover functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package uncover
 */

if ( ! function_exists( 'uncover_setup' ) ) :
	/**
	 * Sets up theme defaults and registers support for various WordPress features.
	 *
	 * Note that this function is hooked into the after_setup_theme hook, which
	 * runs before the init hook. The init hook is too late for some features, such
	 * as indicating support for post thumbnails.
	 */
	function uncover_setup() {
		/*
		 * Make theme available for translation.
		 * Translations can be filed in the /languages/ directory.
		 * If you're building a theme based on uncover, use a find and replace
		 * to change 'uncover' to the name of your theme in all the template files.
		 */

		// Add default posts and comments RSS feed links to head.
		add_theme_support( 'automatic-feed-links' );

		/*
		 * Let WordPress manage the document title.
		 * By adding theme support, we declare that this theme does not use a
		 * hard-coded <title> tag in the document head, and expect WordPress to
		 * provide it for us.
		 */
		add_theme_support( 'title-tag' );

		/*
		 * Enable support for Post Thumbnails on posts and pages.
		 *
		 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
		 */
		add_theme_support( 'post-thumbnails' );
		add_image_size( 'uncover-thumb', 380, 360, true );	

		// This theme uses wp_nav_menu() in one location.
		register_nav_menus( array(
			'menu-1' => esc_html__( 'Primary', 'uncover' ),
		) );

		/*
		 * Switch default core markup for search form, comment form, and comments
		 * to output valid HTML5.
		 */
		add_theme_support( 'html5', array(
			'comment-form',
			'comment-list',
			'gallery',
			'caption',
		) );

		// Set up the WordPress core custom background feature.
		add_theme_support( 'custom-background', apply_filters( 'uncover_custom_background_args', array(
			'default-color' => '000000',
			'default-image' => '',
		) ) );

		// Add theme support for selective refresh for widgets.
		add_theme_support( 'customize-selective-refresh-widgets' );
		
		// Add support for Custom Header.
		add_theme_support( 'custom-header', apply_filters( 'uncover_custom_header_args', array(
				'default-image' => get_template_directory_uri() . '/images/default-banner.jpg',
				'width'         => 1920,
				'height'        => 500,
				'flex-height'   => true,
				'header-text'   => false,
		) ) );

		// Register default headers.
		register_default_headers( array(
			'default-banner' => array(
				'url'           => '%s/images/default-banner.jpg',
				'thumbnail_url' => '%s/images/default-banner.jpg',
				'description'   => esc_html_x( 'Default Banner', 'header image description', 'uncover' ),
			),

		) );		

		/**
		 * Add support for core custom logo.
		 *
		 * @link https://codex.wordpress.org/Theme_Logo
		 */
		add_theme_support( 'custom-logo', array(
			'height'      => 70,
			'width'       => 250,
			'flex-width'  => true,
			'flex-height' => true,
		) );
	}
endif;
add_action( 'after_setup_theme', 'uncover_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function uncover_content_width() {
	// This variable is intended to be overruled from themes.
	// Open WPCS issue: {@link https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/issues/1043}.
	// phpcs:ignore WordPress.NamingConventions.PrefixAllGlobals.NonPrefixedVariableFound
	$GLOBALS['content_width'] = apply_filters( 'uncover_content_width', 640 );
}
add_action( 'after_setup_theme', 'uncover_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function uncover_widgets_init() {
	register_sidebar( array(
		'name'          => esc_html__( 'Sidebar', 'uncover' ),
		'id'            => 'sidebar-1',
		'description'   => esc_html__( 'Add widgets here.', 'uncover' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
		'before_title'  => '<h2 class="widget-title">',
		'after_title'   => '</h2>',
	) );	
	
	for ( $i = 1; $i <= 3; $i++ ) {
		register_sidebar( array(
			'name'          => sprintf( esc_html__( 'Footer %d', 'uncover' ), $i ),
			'id'            => 'footer-' . $i,
			'before_widget' => '<div id="%1$s" class="widget %2$s">',
			'after_widget'  => '</div>',
			'before_title'  => '<h3 class="widget-title">',
			'after_title'   => '</h3>',
		) );
	}
}
add_action( 'widgets_init', 'uncover_widgets_init' );

/**
 * Enqueue scripts and styles.
 */
function uncover_scripts() {
	$min = defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ? '' : '.min';
	
	wp_enqueue_style( 'uncover-style', get_stylesheet_uri() );
	
	wp_register_style( 'flexslider', get_template_directory_uri() . '/css/flexslider.css' );
	wp_enqueue_style( 'flexslider' );
	
	wp_register_style( 'uncover-google-fonts', '//fonts.googleapis.com/css?family=Lato' );
	wp_enqueue_style( 'uncover-google-fonts' );
	
	wp_register_style( 'bootstrap', get_template_directory_uri() . '/css/bootstrap.css' );
	wp_enqueue_style( 'bootstrap' );
		
	wp_enqueue_style( 'font-awesome', get_template_directory_uri() . '/fonts/font-awesome/css/font-awesome' . $min . '.css', '', '4.7.0' );


	wp_enqueue_script( 'uncover-navigation', get_template_directory_uri() . '/js/navigation.js', array(), '20151215', true );
	
	wp_enqueue_script( 'uncover-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20151215', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'uncover_scripts' );

function uncover_of_register_js() {
	if (!is_admin()) {
		
			$suffix = ( defined( 'SCRIPT_DEBUG' ) && SCRIPT_DEBUG ) ? '' : '.min';
		
		
		wp_enqueue_script( 'flexslider', get_template_directory_uri() . '/js/jquery.flexslider.js', array('jquery'), '2.1', true );
		wp_enqueue_script( 'uncover-custom', get_template_directory_uri() . '/js/jquery.custom.js', array('jquery'), '1.0', true );	
	}
}
add_action('init', 'uncover_of_register_js');


/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Functions which enhance the theme by hooking into WordPress.
 */
require get_template_directory() . '/inc/template-functions.php';

/**
 * Customizer additions.
 */


/**
 * Load Jetpack compatibility file.
 */
if ( defined( 'JETPACK__VERSION' ) ) {
	require get_template_directory() . '/inc/jetpack.php';
}

// Include theme widgets.


/**
 * Load about.
 */
if ( is_admin() ) {
	require_once trailingslashit( get_template_directory() ) . 'admin/about/class.info.php';
	require_once trailingslashit( get_template_directory() ) . 'admin/about/info.php';
}
require_once( trailingslashit( get_template_directory() ) . 'trt-customizer-pro/uncover/class-customize.php' );
require_once trailingslashit( get_template_directory() ) . 'admin/tgm/class-tgm-plugin-activation.php';
require_once trailingslashit( get_template_directory() ) . 'admin/tgm/tgm.php';
require get_template_directory() . '/admin/font-awesome-list.php';