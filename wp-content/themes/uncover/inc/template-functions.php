<?php
/**
 * Functions which enhance the theme by hooking into WordPress
 *
 * @package uncover
 */

/**
 * Adds custom classes to the array of body classes.
 *
 * @param array $classes Classes for the body element.
 * @return array
 */
 function uncover_allowed_html() {

	$allowed_tags = array(
		'a' => array(
			'class' => array(),
			'href'  => array(),
			'rel'   => array(),
			'title' => array(),
		),
		'link' => array(
			'class' => array(),
			'href'  => array(),
			'rel'   => array(),
			'title' => array(),
		),	
		'abbr' => array(
			'title' => array(),
		),
		'b' => array(),
		'blockquote' => array(
			'cite'  => array(),
		),
		'cite' => array(
			'title' => array(),
		),
		'code' => array(),
		'del' => array(
			'datetime' => array(),
			'title' => array(),
		),
		'dd' => array(),
		'div' => array(
			'class' => array(),
			'title' => array(),
			'style' => array(),
		),
		'dl' => array(),
		'dt' => array(),
		'em' => array(),
		'h1' => array(),
		'h3' => array(),
		'h4' => array(),
		'h5' => array(),
		'h6' => array(),
		'i' => array(),
		'img' => array(
			'alt'    => array(),
			'class'  => array(),
			'height' => array(),
			'src'    => array(),
			'width'  => array(),
		),
		'li' => array(
			'class' => array(),
		),
		'ol' => array(
			'class' => array(),
		),
		'p' => array(
			'class' => array(),
		),
		'q' => array(
			'cite' => array(),
			'title' => array(),
		),
		'span' => array(
			'class' => array(),
			'title' => array(),
			'style' => array(),
		),
		'h2' => array(
			'class' => array(),
		),		
		'strike' => array(),
		'strong' => array(),
		'ul' => array(
			'class' => array(),
		),
	);
	
	return $allowed_tags;
}
	$allowed_html = uncover_allowed_html();
function uncover_body_classes( $classes ) {
	// Adds a class of hfeed to non-singular pages.
	if ( ! is_singular() ) {
		$classes[] = 'hfeed';
	}

	// Adds a class of no-sidebar when there is no sidebar present.
	if ( ! is_active_sidebar( 'sidebar-1' ) ) {
		$classes[] = 'no-sidebar';
	}

	return $classes;
}
add_filter( 'body_class', 'uncover_body_classes' );

/**
 * Add a pingback url auto-uncovery header for single posts, pages, or attachments.
 */
function uncover_pingback_header() {
	if ( is_singular() && pings_open() ) {

		echo wp_kses('<link rel="pingback" href="' . esc_url( get_bloginfo( 'pingback_url' ) ) . '">', $allowed_html);
	
	}
}
add_action( 'wp_head', 'uncover_pingback_header' );

if ( ! function_exists( 'uncover_title' ) ) :

	/**
	 * Customize header title.
	 *
	 * @since 1.0.0
	 *
	 * @param string $title Title.
	 * @return string Modified title.
	 */
	function uncover_title( $title ) {
			$blog_title = get_theme_mod('uncover_blog_title');
		if ( is_home() && $blog_title != NULL) {
			$title = get_theme_mod('uncover_blog_title');
		} elseif ( is_home() && $blog_title == NULL ) {
			$title = sprintf( esc_html__( 'Blog', 'uncover' ),  get_search_query() );		
		} elseif ( is_singular() ) {
			$title = single_post_title( '', false );
		} elseif ( is_category() || is_tag() ) {
			$title = single_term_title( '', false );
		} elseif ( is_archive() ) {
			$title = strip_tags( get_the_archive_title() );
		} elseif ( is_search() ) {
			$title = sprintf( esc_html__( 'Search Results for: %s', 'uncover' ),  get_search_query() );
		} elseif ( is_404() ) {
			$title = esc_html__( '404!', 'uncover' );
		}

		return $title;
	}

endif;

add_filter( 'uncover_filter_title', 'uncover_title' );

if ( ! function_exists( 'uncover_excerpt_length' ) ) :
/**
 * uncover Excerpt Length
 *
 * @since uncover 1.0
 */
function uncover_excerpt_length( $length ) {
 if ( ! is_admin() ) {
	return 30;
	}
}
endif;
add_filter( 'excerpt_length', 'uncover_excerpt_length' );

function uncover_auto_excerpt_more( $more ) {
 if ( ! is_admin() ) {
	return ' &hellip;' ;
	}
}
add_filter( 'excerpt_more', 'uncover_auto_excerpt_more' );

if ( ! function_exists( 'uncover_primary_navigation_fallback' ) ) :

	/**
	 * Fallback for primary navigation.
	 *
	 * @since 1.0.0
	 */
	function uncover_primary_navigation_fallback() {

		echo wp_kses('<ul>', $allowed_html);
		echo wp_kses('<li><a href="' . esc_url( home_url( '/' ) ) . '">' . esc_html__( 'Home', 'uncover' ) . '</a></li>', $allowed_html);				

		$args = array(
			'posts_per_page' => 5,
			'post_type'      => 'page',
			'orderby'        => 'name',
			'order'          => 'ASC',
			);

		$the_query = new WP_Query( $args );

		if ( $the_query->have_posts() ) {
			while ( $the_query->have_posts() ) {
				$the_query->the_post();
				the_title( '<li><a href="' . esc_url( get_permalink() ) . '">', '</a></li>' );
			}

			wp_reset_postdata();
		}

		echo wp_kses('</ul>', $allowed_html);
	}

endif;

if ( ! function_exists( 'uncover_get_the_excerpt' ) ) :

	/**
	 * Fetch excerpt from the post.
	 *
	 * @since 1.0.0
	 *
	 * @param int     $length      Excerpt length.
	 * @param WP_Post $post_object WP_Post instance.
	 * @return string Excerpt content.
	 */
	function uncover_get_the_excerpt( $length, $post_object = null ) {

		global $post;

		if ( is_null( $post_object ) ) {
			$post_object = $post;
		}

		$length = absint( $length );

		if ( 0 === $length ) {
			return;
		}

		$source_content = $post_object->post_content;

		if ( ! empty( $post_object->post_excerpt ) ) {
			$source_content = $post_object->post_excerpt;
		}

		$source_content = strip_shortcodes( $source_content );
		$trimmed_content = wp_trim_words( $source_content, $length, '&hellip;' );

		return $trimmed_content;
	}

endif;

if ( ! function_exists( 'uncover_helper_the_excerpt' ) ) :

	/**
	 * Generate excerpt.
	 *
	 * @since 1.0.0
	 *
	 * @param int     $length Excerpt length in words.
	 * @param WP_Post $post_obj WP_Post instance (Optional).
	 * @return string Excerpt.
	 */
	function uncover_helper_the_excerpt( $length = 40, $post_obj = null ) {

		global $post;
		if ( is_null( $post_obj ) ) {
			$post_obj = $post;
		}
		$length = absint( $length );
		if ( $length < 1 ) {
			$length = 40;
		}
		$source_content = $post_obj->post_content;
		if ( ! empty( $post_obj->post_excerpt ) ) {
			$source_content = $post_obj->post_excerpt;
		}
		$source_content = preg_replace( '`\[[^\]]*\]`', '', $source_content );
		$trimmed_content = wp_trim_words( $source_content, $length, '...' );
		return $trimmed_content;

	}

endif;