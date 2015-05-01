/** Scroll on page when you press the arrow on the about page. */
$(document).on('page:change', function() {
  (function (jQuery) {
    jQuery.mark = {
      jump: function (options) {
        var defaults = {
          selector: 'a.prev'
        };
        if (typeof options == 'string') defaults.selector = options;
        var options = jQuery.extend(defaults, options);
        return jQuery(options.selector).click(function (e) {
          var jumpobj = jQuery(this);
          var target = jumpobj.attr('href');
          var thespeed = 1000;
          var offset = jQuery(target).offset().top;
          jQuery('html,body').animate({
            scrollTop: offset
          }, thespeed, 'swing')
          e.preventDefault();
        })
      }
    }
  })(jQuery);

  jQuery(function(){  
    jQuery.mark.jump();
  });

});
