<?php
/**
 * The main template file
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package uncover
 */

get_header();
$banner = get_header_image();
?>

<div id="custom-header">

				<?php if ( ! empty( $banner ) ) : ?>
		<img src="<?php echo esc_url( $banner ); ?>" alt="" />
	<?php endif; ?>

		<div class="custom-header-content">
			<div class="container">
			<?php $header_title = apply_filters( 'uncover_filter_title', '' ); ?>
			<h1 class="page-title"><?php echo esc_html( $header_title ); ?></h1>
			</div>
			
		</div>
			</div><!-- #custom-header -->

	<div id="content" class="site-content">
	
					<div class="container">

					<div class="row">

	<div id="primary" class="content-area">
		<main id="main" class="site-main">

		<?php
		if ( have_posts() ) :


			/* Start the Loop */
			while ( have_posts() ) :
				the_post();

				/*
				 * Include the Post-Type-specific template for the content.
				 * If you want to override this in a child theme, then include a file
				 * called content-___.php (where ___ is the Post Type name) and that will be used instead.
				 */
				get_template_part( 'template-parts/content', get_post_type() );

			endwhile;

			the_posts_navigation();

		else :

			get_template_part( 'template-parts/content', 'none' );

		endif;
		?>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_sidebar(); ?>



</div><!-- .inner-wrapper -->

			</div><!-- .container -->

	</div><!-- #content -->


<?php get_footer();
