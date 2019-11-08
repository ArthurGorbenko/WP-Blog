<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package uncover
 */

?>
	
	<?php
	get_sidebar( 'footer' );
			?>

	<footer id="colophon" class="site-footer">
	
	<div class="container">
	
	
		<div class="site-info">
			<?php esc_html_e( 'Copyright', 'uncover' ); ?> <?php echo esc_attr(date_i18n(__('Y','uncover'))); ?> <?php echo esc_html(get_theme_mod('uncover_footer_title')); ?> | <?php esc_html_e( 'Powered by', 'uncover' ); ?> <a href="http://www.wordpress.org"><?php esc_html_e( 'WordPress', 'uncover' ); ?></a> | <?php esc_html_e( 'uncover theme by', 'uncover' ); ?> <a href="https://www.themeszen.com"><?php esc_html_e( 'themeszen', 'uncover' ); ?></a>
		</div><!-- .site-info -->
		
	</div><!-- .container -->
		
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
