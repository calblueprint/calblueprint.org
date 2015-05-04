$(document).on('page:change', function() {
  $apply_nav = $("#apply_nav");
  if ($apply_nav) {
    $apply_nav.children().each(function(id, child) {
      $(child).on("click", function(e) {
        $('html, body').animate({
          scrollTop: $("#" + $(child).data().target).offset().top
        }, 2000);
        e.preventDefault();
        return false;
      });
    });
  }


  $drawers = $(".drawer");
  if ($drawers) {
    $drawers.each(function(id, drawer) {
      $(drawer).children().first().on("click", function() {
        if (!$(drawer).children().last().hasClass("active")) {
          $(drawer).children().last().addClass("active");
          $(drawer).children().first().children().first().text("(-)");
        } else {
          $(drawer).children().last().removeClass("active");
          $(drawer).children().first().children().first().text("(+)");
        }
      });
    });
  }
});
