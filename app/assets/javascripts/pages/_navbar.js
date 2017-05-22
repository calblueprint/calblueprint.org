$(window).scroll((e) => {
  if ($(this).scrollTop() > 400) {
    // $(".bp-nav").css("transform", "translateY(-100%)");
    $(".bp-nav-fixed").addClass("nav-fixed-show");
    // $(".bp-nav-fixed").removeClass("nav-white");
  } else {
    // $(".bp-nav").css("transform", "translateY(0)");
    $(".bp-nav-fixed").removeClass("nav-fixed-show");
    // $(".bp-nav-fixed").addClass("nav-white");
  }
})
