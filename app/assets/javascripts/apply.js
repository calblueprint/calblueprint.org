$(document).ready(function() {
  $apply_nav = $("#apply_nav");
  if (!$apply_nav) {
    return;
  }

  $apply_nav.children().each(function(id, child) {
    $(child).on("click", function(e) {
      $('html, body').animate({
        scrollTop: $("#" + $(child).data().target).offset().top
      }, 2000);
      e.preventDefault();
      return false;
    });
  });
});
