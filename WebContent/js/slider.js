/**
 * Slider
 */

(function($) {

  'use strict';

  $.slider = function(container, options) {

    // default options
    var defaultOptions = {
      items: 1,
      interval: 1000,
      loop: false,
      imgWidth: 300,
      callback: function() {}
    };

    // assigned options
    var settings = $.extend(defaultOptions, options);

    var $container = $(container);
    var $item_slider = $container.find('.slider_item');
    var $lists_slider = $container.find('.slider_list');
    var $controlNav = $container.find('.slider_control-nav');
    var $sliderControlNav = $('<div/>');
    var $sliderControlNavItem;

    var CSS_IMG_WIDTH = settings.imgWidth;
    var CSS_CLASS_ACTIVE = 'is-active';

    var slideActive = 0;
    var sliderInterval = 0; // interval of the animation
    var slidesCount = $container.find('.slider_item').length; // the number of slides
    var sliderControlItem = Math.floor(slidesCount/settings.items); // integer number sliders view
    var notFullSlider = slidesCount % settings.items; // not full slider view
    var sliderWidth = CSS_IMG_WIDTH * slidesCount + CSS_IMG_WIDTH * settings.items;
    var sliderWidthItems = CSS_IMG_WIDTH * settings.items;
    var marginSlider = - CSS_IMG_WIDTH * settings.items; // 'margin-left' - for infinite slider
/*--------------------------------------------------------------------------------------------------------------*/
    var initialize = function() {
      buildSlidersList();
      buildSliderControl();
      stylesSlider();
      animateStart();
      setHandlers();
    };
/*--------------------------------------------------------------------------------------------------------------*/
    // Initialize HTML elements Sliders List
    var buildSlidersList = function() {
      for (var y = 0; y < settings.items; y++) {
        $($item_slider).eq(y).clone().appendTo($lists_slider);
        $($item_slider).eq(slidesCount - (1 + y)).clone().prependTo($lists_slider);
      }
      $($lists_slider).css({transform: 'translateX(' + marginSlider  + 'px)'});
    };
/*--------------------------------------------------------------------------------------------------------------*/
     // Initialize HTML elements slider contro
    var buildSliderControl = function() {
      if (notFullSlider != 0) { 
        sliderControlItem++;
      }
      for (var x = 1; x <= sliderControlItem; x++) {
        var divSliderControl = $('<div/>', {class: "slider_control-nav-item"}).appendTo($sliderControlNav);
      }
      $($sliderControlNav).appendTo($controlNav);
      $sliderControlNavItem = $sliderControlNav.find('.slider_control-nav-item');
      $sliderControlNavItem.eq(slideActive).addClass(CSS_CLASS_ACTIVE);
    }
/*--------------------------------------------------------------------------------------------------------------*/
    // Add styles for Slider
    var stylesSlider = function() {
      $lists_slider.css({'width': sliderWidth * 2});
      $container.find('.slider_viewport').css({'width': sliderWidthItems,'overflow': 'hidden'});
      $container.find('img').css({'width': CSS_IMG_WIDTH});     
    };
/*--------------------------------------------------------------------------------------------------------------*/
    // interval of the animation
    var animateStart = function() {
      sliderInterval = setInterval(function () {
        animateSlider('next');
      }, settings.interval);
    };

/*--------------------------------------------------------------------------------------------------------------*/
    // event handler
    var setHandlers = function() {
      $container.on('click', '.slider_arrow__left', function() {
        animateSlider('prev');
      });
      $container.on('click', '.slider_arrow__right', function() {
        animateSlider('next');
      });
      // event handler on slider contro
      $container.on('click', '.slider_control-nav-item', function() {
        animateStop();
        var $this = $(this);
        $container.find('.slider_control-nav-item').removeClass(CSS_CLASS_ACTIVE);
        $this.addClass(CSS_CLASS_ACTIVE);
        slideActive = $container.find('.is-active').index();
        marginSlider = -(sliderWidthItems * (slideActive + 1));
        $lists_slider.css({transform: 'translateX(' + marginSlider + 'px)'});
        animateStart();
      });
    }
/*--------------------------------------------------------------------------------------------------------------*/
    initialize();
/*--------------------------------------------------------------------------------------------------------------*/
    // animate
    var animateSlider = function(arg) {
      slideActive = $container.find('.is-active').index();
      // scroll through the slider 'next'
      if (arg === 'next') {

        // slider is not infinite
        if (!settings.loop && slideActive === sliderControlItem - 1) {
          return animateStop();
        }

        // not full slider view
        if (notFullSlider != 0 && slideActive === sliderControlItem - 1) {
          return animateStop();
        }

        if (slideActive != sliderControlItem) {
          $lists_slider.addClass('animate');
          marginSlider += -sliderWidthItems;
          $lists_slider.css({transform: 'translateX(' + marginSlider + 'px)'});
          slideActive++;
          addClassIsActive(slideActive);
        }
        if (slideActive === sliderControlItem) {
          $lists_slider.css('transform', 'translate(' + marginSlider  + 'px)');
          setTimeout(function () {
              $lists_slider.removeClass('animate');
              $lists_slider.css('transform', 'translate(' + -sliderWidthItems + 'px)');
          }, 500);
          marginSlider = -sliderWidthItems;
          slideActive = 0;
          addClassIsActive(slideActive);
        } 
      }

      // scroll through the slider 'prev'
      if (arg === 'prev') {

        // slider is not infinite
        if (!settings.loop && slideActive === 0) {
          return animateStop();
        }

        // not full slider view
        if (notFullSlider != 0 && slideActive === 0) {
          return animateStop();
        }

        if (slideActive != -1) {
          $lists_slider.addClass('animate');
          marginSlider += sliderWidthItems;
          $lists_slider.css({transform: 'translateX(' + marginSlider + 'px)'});
          slideActive--;
          addClassIsActive(slideActive);
        }
        if (slideActive === -1) {
          $lists_slider.css('transform', 'translate(' + marginSlider  + 'px)');
          setTimeout(function () {
              $lists_slider.removeClass('animate');
              $lists_slider.css('transform', 'translate(' + -CSS_IMG_WIDTH * slidesCount  + 'px)');
          }, 500);
          marginSlider = -CSS_IMG_WIDTH * slidesCount;
          slideActive = sliderControlItem - 1;
          addClassIsActive(slideActive);
        } 
      }

      //current slide
      settings.callback(slideActive + 1);
    };
/*--------------------------------------------------------------------------------------------------------------*/
    // animation stop
    var animateStop = function() {
      clearInterval(sliderInterval);
    };

    // animation stop if :hover
    $container.find('.slider_arrow__left').hover(function() {
      animateStop();
    }, animateStart);

    // animation stop if :hover
    $container.find('.slider_arrow__right').hover(function() {
      animateStop();
    }, animateStart);
/*--------------------------------------------------------------------------------------------------------------*/
    // adding and removing class IS_ACTIVE
    var addClassIsActive = function(slideActive) {
      $sliderControlNavItem.removeClass(CSS_CLASS_ACTIVE);
      $sliderControlNavItem.eq(slideActive).addClass(CSS_CLASS_ACTIVE);
    };
/*--------------------------------------------------------------------------------------------------------------*/
    this.getSlidesCount = function() {
      return slidesCount;
    };
/*--------------------------------------------------------------------------------------------------------------*/
  }
/*--------------------------------------------------------------------------------------------------------------*/
  $.fn.slider = function(options) {
    if (options === undefined) {
      options = {};
    }
    if (typeof options === 'object') {
      return new $.slider(this, options);
    }
  }

})(jQuery);