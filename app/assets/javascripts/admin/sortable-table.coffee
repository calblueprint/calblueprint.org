# This function initializes Sortable (https://github.com/RubaXa/Sortable) for
# a of sortable items.
#
# Args:
#   el (a DOM/jQuery element) - contains sortable elements
#   onUpdate (function) - callback function that will be called with an Event
#     argument once an item is dragged to a new position. You can use
#     evt.oldIndex and evt.newIndex to get the updated position of the item.
#
# Add the .js-sortable class to the tbody element that needs to be sortable.
# If you are using handles, make each handle have the .js-sortable-handle class.
# For example, a sortable table might look like:
#
# table
#   thead
#     tr
#       th Sorting Handle
#       th Col1
#       th Col2
#     tbody.js-sortable
#       tr
#         td = fa_icon 'arrows', class: 'js-sortable-handle'
#         td Stuff
#         td More stuff
#       tr
#         td = fa_icon 'arrows', class: 'js-sortable-handle'
#         td Stuff2
#         td More stuff2

initSortableTable = (el, onUpdate) ->
  Sortable.create el,
    handle: '.js-sortable-handle'
    animation: 150
    onUpdate: onUpdate

# Initialize sortable for the projects table on the index page
ready ->
  $('.js-projects-sortable').each ->
    initSortableTable this, (evt) ->
      data = {
        id: evt.item.dataset.id
        # We have to add one since Sortable uses 0 indexing while acts_as_list
        # starts at 1
        newPos: evt.newIndex + 1
      }

      # Post to Admin::ProjectsController#change_position
      # We don't do anything here to give feedback that the request went
      # through, although we could.
      $.post '/admins/projects/change_position', data
