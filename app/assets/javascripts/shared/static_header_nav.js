$(document).on("ready page:load", function() {
  $(".static-page-hero .page-nav .page-nav-link").each(function(index, el) {
    $(el).click(function() {
      var sectionName = $(this).attr("section-name");
      $('html, body').animate({
        scrollTop: $("#" + sectionName).offset().top
      }, 400);
    })
  })
})
