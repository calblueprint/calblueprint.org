toggle_disclaimer = ->
  $cs169Check = $('#nonprofit_application_cs169_pool')
  $cs169Disclaimer = $('.js-cs169-disclaimer')
  $cs169ClientStatus = $('.nonprofit_application_client_status')
  toggle_callback = ->
    if $cs169Check.prop('checked')
      $cs169Disclaimer.css({'visibility': 'visible', 'display': 'block'})
      $cs169ClientStatus.css({'visibility': 'visible', 'display': 'block'})
    else
      $cs169Disclaimer.css({'visibility': 'hidden', 'display': 'none'})
      $cs169ClientStatus.css({'visibility': 'hidden', 'display': 'none'})

  $cs169Check.change(toggle_callback)
  toggle_callback()

ready toggle_disclaimer
