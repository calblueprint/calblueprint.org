# ready func_name runs the function on page load for both reg and turbolink page load
window.ready = (func) ->
  $(document).ready func
  $(document).on "page:load", func
