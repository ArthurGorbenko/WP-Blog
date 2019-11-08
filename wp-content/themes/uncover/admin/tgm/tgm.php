<?php
/**
 * Recommended plugins
 *
 * @package uncover
 */

if ( ! function_exists( 'uncover_recommended_plugins' ) ) :

	/**
	 * Recommend plugins.
	 *
	 * @since 1.0.0
	 */
	function uncover_recommended_plugins() {

		$plugins = array(
			array(
				'name'     => esc_html__( 'Zen Toolkit', 'uncover' ),
				'slug'     => 'zen-toolkit',
				'required' => false,
			),
		);

		tgmpa( $plugins );

	}

endif;

add_action( 'tgmpa_register', 'uncover_recommended_plugins' );
