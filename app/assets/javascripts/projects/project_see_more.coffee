project_see_more = ->
  $('.project-see-more').click ->
    expand = $(this).parent().parent().children('.project-expand')
    if expand.is(':hidden')
      expand.slideDown 'slow'
    else
      expand.slideUp 'slow'

ready project_see_more
