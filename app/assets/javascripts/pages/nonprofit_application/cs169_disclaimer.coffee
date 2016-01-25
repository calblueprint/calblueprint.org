toggle_disclaimer = ->
  $cs169Check = $('#nonprofit_application_cs169_pool')
  $cs169Disclaimer = $('.js-cs169-disclaimer')
  toggle_callback = ->
    if $cs169Check.prop('checked')
      $cs169Disclaimer.css({'visibility': 'visible', 'display': 'block'})
    else
      $cs169Disclaimer.css({'visibility': 'hidden', 'display': 'none'})

  $cs169Check.change(toggle_callback)
  toggle_callback()

ready toggle_disclaimer
