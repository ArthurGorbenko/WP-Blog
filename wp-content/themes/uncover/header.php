<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package uncover
 */

?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="https://gmpg.org/xfn/11">

	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
 <?php
 if ( function_exists( 'wp_body_open' ) ) {
                 wp_body_open();
         }
	?>
<div id="page" class="site">
	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'uncover' ); ?></a>

	<header id="masthead" class="site-header">
		<div class="container">
		
		<div class="site-branding">
		
		<?php 
	if ( function_exists( 'has_custom_logo' ) && has_custom_logo() ) { ?>
		<?php the_custom_logo(); ?>
	<?php } else { ?>
		<?php	if ( is_front_page() && is_home() ) :?>
		<h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
				<?php
			else :
				?>
				<p class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></p>
				<?php
			endif;
			$uncover_description = get_bloginfo( 'description', 'display' );
			if ( $uncover_description || is_customize_preview() ) :
				?>
				<p class="site-description"><?php echo esc_html($uncover_description); /* WPCS: xss ok. */ ?></p>
			<?php endif; ?>
	<?php } ?>
		</div><!-- .site-branding -->

	<!--top menu-->
<div id="menu_container">

			<nav id="site-navigation" class="main-navigation clearfix">
				<h3 class="menu-toggle"><?php esc_attr_e( 'Menu', 'uncover' ); ?></h3>
			<?php
			wp_nav_menu( array(
				'theme_location' => 'menu-1',
				'menu_id'        => 'primary-menu',
				'fallback_cb'    => 'uncover_primary_navigation_fallback',				
			) );
			?>
			</nav><!-- #site-navigation -->
		<div class="clear"></div>
	</div>

	</div><!-- .container -->			
	</header><!-- #masthead -->