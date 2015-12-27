# This implements a auto-resizing textarea based on http://stackoverflow.com/a/25621277
#
# Add the .js-resizing-textarea class to any textarea you want to auto-resize.

resizing_textarea = ->
  $(".js-resizing-textarea").each(->
    @setAttribute "style", "height:#{@scrollHeight}px;overflow-y:hidden;"
  ).on "input", ->
    @style.height = "auto"
    @style.height = "#{@scrollHeight}px"

ready resizing_textarea
