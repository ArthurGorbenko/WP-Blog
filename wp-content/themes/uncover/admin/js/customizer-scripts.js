jQuery(document).ready(function($) {
    //"use strict";
	
    //FontAwesome Icon Control JS
    $('body').on('click', '.uncover-icon-list li', function(){
        var icon_class = $(this).find('i').attr('class');
        $(this).addClass('icon-active').siblings().removeClass('icon-active');
        $(this).parent('.uncover-icon-list').prev('.uncover-selected-icon').children('i').attr('class','').addClass(icon_class);
        $(this).parent('.uncover-icon-list').next('input').val(icon_class).trigger('change');
    });

    $('body').on('click', '.uncover-selected-icon', function(){
        $(this).next().slideToggle();
    });	

    //Switch Control
    $('body').on('click', '.onoffswitch', function(){
        var $this = $(this);
        if($this.hasClass('switch-on')){
            $(this).removeClass('switch-on');
            $this.next('input').val('off').trigger('change')
        }else{
            $(this).addClass('switch-on');
            $this.next('input').val('on').trigger('change')
        }
    });

    //MultiCheck box Control JS
    $( '.customize-control-checkbox-multiple input[type="checkbox"]' ).on( 'change', function() {

            var checkbox_values = $( this ).parents( '.customize-control' ).find( 'input[type="checkbox"]:checked' ).map(
                function() {
                    return $( this ).val();
                }
            ).get().join( ',' );

            $( this ).parents( '.customize-control' ).find( 'input[type="hidden"]' ).val( checkbox_values ).trigger( 'change' );
        
        }
    );

});

// Extends our custom section.
( function( api ) {

    api.sectionConstructor['pro-section'] = api.Section.extend( {

        // No events for this type of section.
        attachEvents: function () {},

        // Always make the section active.
        isContextuallyActive: function () {
            return true;
        }
    } );

} )( wp.customize );

