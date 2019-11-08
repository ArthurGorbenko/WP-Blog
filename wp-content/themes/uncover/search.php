<?php
/**
 * The template for displaying search results pages
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#search-result
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

	<section id="primary" class="content-area">
		<main id="main" class="site-main">

		<?php if ( have_posts() ) : ?>



			<?php
			/* Start the Loop */
			while ( have_posts() ) :
				the_post();

				/**
				 * Run the loop for the search to output the results.
				 * If you want to overload this in a child theme then include a file
				 * called content-search.php and that will be used instead.
				 */
				get_template_part( 'template-parts/content', 'search' );

			endwhile;

			the_posts_navigation();

		else :

			get_template_part( 'template-parts/content', 'none' );

		endif;
		?>

		</main><!-- #main -->
	</section><!-- #primary -->

<?php
get_sidebar(); ?>

</div><!-- .inner-wrapper -->

			</div><!-- .container -->

	</div><!-- #content -->

<?php get_footer();
