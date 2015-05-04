drawers = ->
  $('.drawer').each (id, drawer) ->
    $(drawer).children().first().on 'click', ->
      if !$(drawer).children().last().hasClass('active')
        $(drawer).children().last().addClass 'active'
        $(drawer).children().first().children().last().text '(-)'
      else
        $(drawer).children().last().removeClass 'active'
        $(drawer).children().first().children().last().text '(+)'

ready drawers
