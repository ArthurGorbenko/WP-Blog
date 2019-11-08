<?php
/**
 * Template part for displaying posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package uncover
 */

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

<?php if( has_post_thumbnail() ) : ?>
	<div class="entry-thumbnail">
	<?php uncover_post_thumbnail(); ?>
	</div>
	<?php endif; ?>
	
	<div class="entry-content-wrapper">

		<header class="entry-header">
		<?php
		if ( is_singular() ) :
			the_title( '<div class="entry-title hidden">', '</div>' );
		else :
			the_title( '<h2 class="entry-title"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark">', '</a></h2>' );
		endif;

		if ( 'post' === get_post_type() ) :
			?>
			<div class="entry-meta">
				<?php
				uncover_posted_on();
				
				?>
			</div><!-- .entry-meta -->
		<?php endif; ?>
	</header><!-- .entry-header -->

	

	<div class="entry-content">
	<?php if ( is_singular() ) : ?>
				<?php the_content(); ?>
			<?php else: ?>
				<?php the_excerpt(); ?>
			<?php endif; ?>
			<?php
				wp_link_pages( array(
					'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'uncover' ),
					'after'  => '</div>',
				) );
			?>
	</div><!-- .entry-content -->
	</div><!-- .entry-content-wrapper -->

</article><!-- #post-<?php the_ID(); ?> -->
