toggle_disclaimer = ->
  $cs169True = $('#nonprofit_application_cs169_pool_true')
  $cs169False = $('#nonprofit_application_cs169_pool_false')
  $cs169ClientStatus = $('.nonprofit_application_client_status')
  toggle_callback = ->
    if $cs169True.prop('checked')
      $cs169ClientStatus.css({'visibility': 'visible', 'display': 'block'})
    else
      $cs169ClientStatus.css({'visibility': 'hidden', 'display': 'none'})

  $cs169True.change(toggle_callback)
  $cs169False.change(toggle_callback)
  toggle_callback()

ready toggle_disclaimer
