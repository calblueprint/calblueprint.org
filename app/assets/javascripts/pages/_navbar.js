$(window).scroll(function() {
  if ($(this).scrollTop() >= 400) {
    $(".bp-nav-fixed").addClass("nav-fixed-show");
  } else {
    $(".bp-nav-fixed").removeClass("nav-fixed-show");
  }
})
