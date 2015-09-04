function mailchimp() {
  $(".newsletter-form").each(function(id, form) {
    $(form).children("button").one("click", function(){
      if ($(form).children("input").val()) {
        var button = this;
        $(button).empty();
        $(button).append("<div class='loading'></div>");
        $.post(
          "/newsletter-subscribe",
          {
            email: $(form).children("input").val(),
            list: $(form).data("list")
          },
          function(data) {
            $(button).empty();
            $(button).append("<i class='fa fa-check-circle-o'></i>");
          }
        ).fail(function() {
          $(button).empty();
          $(button).append("<i class='fa fa-times-circle-o'></i>");
          alert("Something went wrong.");
        });
      }
    });
  });
}

ready(mailchimp);
