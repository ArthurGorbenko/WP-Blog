<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @link https://codex.wordpress.org/Creating_an_Error_404_Page
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

					<h1 class="page-title"><?php esc_html_e( 'Oops! That page can&rsquo;t be found.', 'uncover' ); ?></h1>
			</div>
			
		</div>
				</div><!-- #custom-header -->	
		

	<div id="content" class="site-content">
	
					<div class="container">

					<div class="row">

	<div id="primary" class="content-area">
		<main id="main" class="site-main">

			<section class="error-404 not-found">


				<div class="page-content">
					<p><?php esc_html_e( 'It looks like nothing was found at this location. Maybe try one of the links below or a search?', 'uncover' ); ?></p>

					<?php
					get_search_form();

					?>


				</div><!-- .page-content -->
			</section><!-- .error-404 -->

		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_sidebar(); ?>



</div><!-- .inner-wrapper -->

			</div><!-- .container -->

	</div><!-- #content -->


<?php get_footer();
