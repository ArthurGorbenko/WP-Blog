<?php
/**
 * Info setup
 *
 * @package uncover
 */

if ( ! function_exists( 'uncover_info_setup' ) ) :

	/**
	 * Info setup.
	 *
	 * @since 1.0.0
	 */
	function uncover_info_setup() {

		$config = array(

			// Welcome content.
			'welcome_content' => sprintf( esc_html__( 'A very neat and clean black and yellow business theme. The theme is fully responsive that looks great on any device. The theme supports widgets. And features theme-options, threaded-comments and multi-level dropdown menu. A simple and neat typography. Uses WordPress custom menu, header image, and background. Get free support on https://themeszen.com/?page_id=33', 'uncover' ), 'uncover' ),

			// Tabs.
			'tabs' => array(
				'getting-started' => esc_html__( 'Getting Started', 'uncover' ),
				'support'         => esc_html__( 'Support', 'uncover' ),
				'useful-plugins'  => esc_html__( 'Useful Plugins', 'uncover' ),				
				'upgrade-to-pro'  => esc_html__( 'Upgrade to Pro', 'uncover' ),
				),

			// Quick links.
			'quick_links' => array(
				'theme_url' => array(
					'text' => esc_html__( 'Theme Details', 'uncover' ),
					'url'  => 'https://themeszen.com/uncover-theme/',
					),
				'demo_url' => array(
					'text' => esc_html__( 'View Demo', 'uncover' ),
					'url'  => 'https://demos.themeszen.com/uncover/',
					),
				'documentation_url' => array(
					'text' => esc_html__( 'View Documentation', 'uncover' ),
					'url'  => 'https://themeszen.com/uncover-docs/',
					),
				),

			// Getting started.
			'getting_started' => array(
				'one' => array(
					'title'       => esc_html__( 'Theme Documentation', 'uncover' ),
					'icon'        => 'dashicons dashicons-arrow-right',
					'description' => esc_html__( 'Please check our full documentation for detailed information on how to setup and customize the theme.', 'uncover' ),
					'button_text' => esc_html__( 'View Documentation', 'uncover' ),
					'button_url'  => 'https://themeszen.com/uncover-docs/',
					'button_type' => 'link',
					'is_new_tab'  => true,
					),
				'two' => array(
					'title'       => esc_html__( 'Static Front Page', 'uncover' ),
					'icon'        => 'dashicons dashicons-arrow-right',
					'description' => esc_html__( 'To achieve custom home page other than blog listing, you need to create and set static front page.', 'uncover' ),
					'button_text' => esc_html__( 'Static Front Page', 'uncover' ),
					'button_url'  => admin_url( 'customize.php?autofocus[section]=static_front_page' ),
					'button_type' => 'primary',
					),
				'three' => array(
					'title'       => esc_html__( 'Theme Options', 'uncover' ),
					'icon'        => 'dashicons dashicons-arrow-right',
					'description' => esc_html__( 'Using the WordPress Customizer you can easily customize every aspect of the theme.', 'uncover' ),
					'button_text' => esc_html__( 'Customize', 'uncover' ),
					'button_url'  => wp_customize_url(),
					'button_type' => 'primary',
					),
				'four' => array(
					'title'       => esc_html__( 'Theme Preview', 'uncover' ),
					'icon'        => 'dashicons dashicons-arrow-right',
					'description' => esc_html__( 'Check the theme demo here.', 'uncover' ),
					'button_text' => esc_html__( 'View Demo', 'uncover' ),
					'button_url'  => 'https://demos.themeszen.com/uncover/',
					'button_type' => 'link',
					'is_new_tab'  => true,
					),
				),

			// Support.
			'support' => array(
				'one' => array(
					'title'       => esc_html__( 'Contact Support', 'uncover' ),
					'icon'        => 'dashicons dashicons-arrow-right',
					'description' => esc_html__( 'Got theme support question, you can email us through our contact us form.', 'uncover' ),
					'button_text' => esc_html__( 'Contact Support', 'uncover' ),
					'button_url'  => 'https://themeszen.com/contact-us/',
					'button_type' => 'link',
					'is_new_tab'  => true,
					),
				),
				
// Useful plugins.
			'useful_plugins' => array(
				'description' => esc_html__( 'Theme supports some helpful WordPress plugins to enhance your site.', 'uncover' ),
				),				

			// Upgrade content.
			'upgrade_to_pro' => array(
				'description' => esc_html__( 'If you want more advanced features then you can upgrade to the premium version of the theme.', 'uncover' ),
				'button_text' => esc_html__( 'Buy Pro from ThemesZen', 'uncover' ),
				'button_url'  => 'https://themeszen.com/uncover-theme/',
				'button_type' => 'primary',
				'is_new_tab'  => true,
				),
			);

		uncover_Info::init( $config );
	}

endif;

add_action( 'after_setup_theme', 'uncover_info_setup' );
