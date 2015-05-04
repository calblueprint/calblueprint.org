apply_nav = ->
  $('#apply_nav').children().each (id, child) ->
    $(child).on 'click', (e) ->
      $('html, body').animate { scrollTop: $('#' + $(child).data().target).offset().top }, 2000
      e.preventDefault()
      false

ready apply_nav
