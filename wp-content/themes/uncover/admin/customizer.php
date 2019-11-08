<?php
/**
 * uncover Theme Customizer
 *
 * @package uncover
 */

/**
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function uncover_customize_register( $wp_customize ) {
	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->get_setting( 'header_textcolor' )->transport = 'postMessage';

	$uncover_categories = get_categories(array('hide_empty' => 0));
	foreach ($uncover_categories as $uncover_category) {
		$uncover_cat[$uncover_category->term_id] = $uncover_category->cat_name;
	}
    
	$uncover_pages = get_pages(array('hide_empty' => 0));
	foreach ($uncover_pages as $uncover_pages_single) {
		$uncover_page_choice[$uncover_pages_single->ID] = $uncover_pages_single->post_title; 
	}

	/*============GENERAL SETTINGS PANEL============*/
	$wp_customize->add_panel(
		'uncover_general_settings_panel',
		array(
			'title' => esc_html__( 'General Settings', 'uncover' ),
			'priority' => 10
		)
	);

	//STATIC FRONT PAGE
	$wp_customize->add_section( 'static_front_page', array(
	    'title' => esc_html__( 'Static Front Page', 'uncover' ),
	    'panel' => 'uncover_general_settings_panel',
	    'description' => esc_html__( 'Your theme supports a static front page.', 'uncover'),
	) );

	//TITLE AND TAGLINE SETTINGS
	$wp_customize->add_section( 'title_tagline', array(
	     'title' => esc_html__( 'Site Logo/Title/Tagline', 'uncover' ),
	     'panel' => 'uncover_general_settings_panel',
	) );

	//BACKGROUND IMAGE
	$wp_customize->add_section( 'background_image', array(
	     'title' => esc_html__( 'Background Image', 'uncover' ),
	     'panel' => 'uncover_general_settings_panel',
	) );

	//COLOR SETTINGS
	$wp_customize->add_section( 'colors', array(
	     'title' => esc_html__( 'Colors' , 'uncover'),
	     'panel' => 'uncover_general_settings_panel',
	) );

	//Footer SETTINGS
	$wp_customize->add_section( 'footer', array(
	     'title' => esc_html__( 'Footer Settings' , 'uncover'),
	     'panel' => 'uncover_general_settings_panel',
	) );
	
		$wp_customize->add_setting(
		'uncover_footer_title',
		array(
			'sanitize_callback' => 'uncover_sanitize_text',
			'default'			=> ''
		)
	);

	$wp_customize->add_control(
		'uncover_footer_title',
		array(
			'settings'		=> 'uncover_footer_title',
			'section'		=> 'footer',
			'type'			=> 'text',
			'label'			=> esc_html__( 'Footer copyright text', 'uncover' )
		)
	);

	//Blog SETTINGS
	$wp_customize->add_section( 'blog', array(
	     'title' => esc_html__( 'Blog Settings' , 'uncover'),
	     'panel' => 'uncover_general_settings_panel',
	) );
	
		$wp_customize->add_setting(
		'uncover_blog_title',
		array(
			'sanitize_callback' => 'uncover_sanitize_text',
			'default'			=> ''
		)
	);

	$wp_customize->add_control(
		'uncover_blog_title',
		array(
			'settings'		=> 'uncover_blog_title',
			'section'		=> 'blog',
			'type'			=> 'text',
			'label'			=> esc_html__( 'Blog title', 'uncover' )
		)
	);

}
add_action( 'customize_register', 'uncover_customize_register' );

/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function uncover_customize_preview_js() {
	wp_enqueue_script( 'uncover-customizer', get_template_directory_uri() . '/js/customizer.js', array( 'customize-preview' ), '20130508', true );
}
add_action( 'customize_preview_init', 'uncover_customize_preview_js' );

function uncover_customizer_script() {
	wp_enqueue_script( 'uncover-customizer-script', get_template_directory_uri() .'/admin/js/customizer-scripts.js', array("jquery"),'', true  );
	wp_enqueue_style( 'uncover-customizer-style', get_template_directory_uri() .'/inc/css/customizer-style.css');	
}
add_action( 'customize_controls_enqueue_scripts', 'uncover_customizer_script' );

if( class_exists( 'WP_Customize_Control' ) ):	

class uncover_Dropdown_Chooser extends WP_Customize_Control{
	public $type = 'dropdown_chooser';

	public function render_content(){
		if ( empty( $this->choices ) )
                return;
		?>
            <label>
                <span class="customize-control-title">
                	<?php echo esc_html( $this->label ); ?>
                </span>

                <?php if($this->description){ ?>
	            <span class="description customize-control-description">
	            	<?php echo wp_kses_post($this->description); ?>
	            </span>
	            <?php } ?>

                <select class="hs-chosen-select" <?php $this->link(); ?>>
                    <?php
                    foreach ( $this->choices as $value => $label )
                        echo '<option value="' . esc_attr( $value ) . '"' . selected( $this->value(), $value, false ) . '>' . esc_html( $label ) . '</option>';
                    ?>
                </select>
            </label>
		<?php
	}
}

class uncover_Customize_Checkbox_Multiple extends WP_Customize_Control {
    public $type = 'checkbox-multiple';

    public function render_content() {

        if ( empty( $this->choices ) )
            return; ?>

        <span class="customize-control-title"><?php echo esc_html( $this->label ); ?></span>

        <?php if ( !empty( $this->description ) ) : ?>
            <span class="description customize-control-description"><?php echo esc_html($this->description); ?></span>
        <?php endif; ?>

        <?php $multi_values = !is_array( $this->value() ) ? explode( ',', $this->value() ) : $this->value(); ?>

        <ul>
            <?php foreach ( $this->choices as $value => $label ) : ?>

                <li>
                    <label>
                        <input type="checkbox" value="<?php echo esc_attr( $value ); ?>" <?php checked( in_array( $value, $multi_values ) ); ?> /> 
                        <?php echo esc_html( $label ); ?>
                    </label>
                </li>

            <?php endforeach; ?>
        </ul>

        <input type="hidden" <?php $this->link(); ?> value="<?php echo esc_attr( implode( ',', $multi_values ) ); ?>" />
    <?php }
}

class uncover_Customize_Heading extends WP_Customize_Control {
	public $type = 'heading';

    public function render_content() {
    	if ( !empty( $this->label ) ) : ?>
            <h3 class="uncover-accordion-section-title"><?php echo esc_html( $this->label ); ?></h3>
        <?php endif;

        if($this->description){ ?>
			<span class="description customize-control-description">
			<?php echo wp_kses_post($this->description); ?>
			</span>
		<?php }
    }
}

class uncover_Dropdown_Multiple_Chooser extends WP_Customize_Control{
	public $type = 'dropdown_multiple_chooser';
	public $placeholder = '';

	public function __construct($manager, $id, $args = array()){
        $this->placeholder = $args['placeholder'];

        parent::__construct( $manager, $id, $args );
    }

	public function render_content(){
		if ( empty( $this->choices ) )
                return;

            $saved_value = $this->value();
            if(!is_array($saved_value)){
            	$saved_value = array();
            }
		?>
            <label>
                <span class="customize-control-title">
					<?php echo esc_html( $this->label ); ?>
				</span>

				<?php if($this->description){ ?>
					<span class="description customize-control-description">
					<?php echo wp_kses_post($this->description); ?>
					</span>
				<?php } ?>

                <select data-placeholder="<?php echo esc_html( $this->placeholder ); ?>" multiple="multiple" class="hs-chosen-select" <?php $this->link(); ?>>
                    <?php
                    foreach ( $this->choices as $value => $label ){
                    	$selected = '';
                    	if(in_array($value, $saved_value)){
                    		$selected = 'selected="selected"';
                    	}
                        echo '<option value="' . esc_attr( $value ) . '"' . esc_attr($selected) . '>' . esc_html($label) . '</option>';
                    }
                    ?>
                </select>
            </label>
		<?php
	}
}

class uncover_Category_Dropdown extends WP_Customize_Control{
    private $cats = false;

    public function __construct($manager, $id, $args = array(), $options = array()){
        $this->cats = get_categories($options);

        parent::__construct( $manager, $id, $args );
    }

    public function render_content(){
        if(!empty($this->cats)){
            ?>
            <label>
                <span class="customize-control-title">
					<?php echo esc_html( $this->label ); ?>
				</span>

				<?php if($this->description){ ?>
					<span class="description customize-control-description">
					<?php echo wp_kses_post($this->description); ?>
					</span>
				<?php } ?>

                <select <?php $this->link(); ?>>
                   <?php
                    foreach ( $this->cats as $cat )
                    {
                        printf('<option value="%s" %s>%s</option>', esc_attr($cat->term_id), selected($this->value(), $cat->term_id, false), esc_html($cat->name));
                    }
                   ?>
                </select>
            </label>
        <?php
        }
    }
}

class uncover_Fontawesome_Icon_Chooser extends WP_Customize_Control{
	public $type = 'icon';

	public function render_content(){
		?>
            <label>
                <span class="customize-control-title">
                <?php echo esc_html( $this->label ); ?>
                </span>

                <?php if($this->description){ ?>
	            <span class="description customize-control-description">
	            	<?php echo wp_kses_post($this->description); ?>
	            </span>
	            <?php } ?>

                <div class="uncover-selected-icon">
                	<i class="fa <?php echo esc_attr($this->value()); ?>"></i>
                	<span><i class="fa fa-angle-down"></i></span>
                </div>

                <ul class="uncover-icon-list clearfix">
                	<?php
                	$uncover_font_awesome_icon_array = uncover_font_awesome_icon_array();
                	foreach ($uncover_font_awesome_icon_array as $uncover_font_awesome_icon) {
							$icon_class = $this->value() == $uncover_font_awesome_icon ? 'icon-active' : '';
							echo '<li class='.esc_attr($icon_class).'><i class="'.esc_attr($uncover_font_awesome_icon).'"></i></li>';
						}
                	?>
                </ul>
                <input type="hidden" value="<?php $this->value(); ?>" <?php $this->link(); ?> />
            </label>
		<?php
	}
}

class uncover_Switch_Control extends WP_Customize_Control{
	public $type = 'switch';
	public $on_off_label = array();

	public function __construct($manager, $id, $args = array() ){
        $this->on_off_label = $args['on_off_label'];
        parent::__construct( $manager, $id, $args );
    }

	public function render_content(){
    ?>
	    <span class="customize-control-title">
			<?php echo esc_html( $this->label ); ?>
		</span>

		<?php if($this->description){ ?>
			<span class="description customize-control-description">
			<?php echo wp_kses_post($this->description); ?>
			</span>
		<?php } ?>

		<?php
			$switch_class = ($this->value() == 'on') ? 'switch-on' : '';
			$on_off_label = $this->on_off_label;
		?>
		<div class="onoffswitch <?php echo esc_attr($switch_class); ?>">
			<div class="onoffswitch-inner">
				<div class="onoffswitch-active">
					<div class="onoffswitch-switch"><?php echo esc_html($on_off_label['on']) ?></div>
				</div>

				<div class="onoffswitch-inactive">
					<div class="onoffswitch-switch"><?php echo esc_html($on_off_label['off']) ?></div>
				</div>
			</div>	
		</div>
		<input <?php $this->link(); ?> type="hidden" value="<?php echo esc_attr($this->value()); ?>"/>
		<?php
    }
}

class uncover_Info_Text extends WP_Customize_Control{

    public function render_content(){
    ?>
	    <span class="customize-control-title">
			<?php echo esc_html( $this->label ); ?>
		</span>

		<?php if($this->description){ ?>
			<span class="description customize-control-description">
			<?php echo wp_kses_post($this->description); ?>
			</span>
		<?php }
    }
}
endif;

//SANITIZATION FUNCTIONS
function uncover_sanitize_text( $input ) {
    return wp_kses_post( force_balance_tags( $input ) );
}

function uncover_sanitize_checkbox( $input ) {
    if ( $input == 1 ) {
        return 1;
    } else {
        return '';
    }
}

function uncover_sanitize_integer( $input ) {
    if( is_numeric( $input ) ) {
        return intval( $input );
    }
}

function uncover_sanitize_choices( $input, $setting ) {
    global $wp_customize;
 
    $control = $wp_customize->get_control( $setting->id );
 
    if ( array_key_exists( $input, $control->choices ) ) {
        return $input;
    } else {
        return $setting->default;
    }
}

function uncover_sanitize_choices_array( $input, $setting ) {
    global $wp_customize;
 	
 	if(!empty($input)){
    	$input = array_map('absint', $input);
    }

    return $input;
} 