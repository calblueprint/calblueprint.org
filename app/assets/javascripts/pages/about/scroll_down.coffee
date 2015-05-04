scroll_down = ->
  do (jQuery) ->
    jQuery.mark = jump: (options) ->
      defaults = selector: 'a.prev'
      if typeof options is 'string'
        defaults.selector = options
      options = jQuery.extend(defaults, options)
      jQuery(options.selector).click (e) ->
        jumpobj = jQuery(this)
        target = jumpobj.attr('href')
        thespeed = 1000
        offset = jQuery(target).offset().top
        jQuery('html,body').animate { scrollTop: offset }, thespeed, 'swing'
        e.preventDefault()

  jQuery ->
    jQuery.mark.jump()

ready scroll_down
