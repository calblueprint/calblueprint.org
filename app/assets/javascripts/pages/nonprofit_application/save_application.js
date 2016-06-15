$(document).on( "page:load ready", function() {
  $("#save_button").on("click", function(e) {
    var endpoint = $(this).data("endpoint");
    var request = {
      method: "POST",
      url: endpoint,
      data: $('[id^="edit_nonprofit_application_"').serialize(),
      dataType: "json"
    };
    $.ajax(request).done(function(response) {
      if (response.success) {
        $("#last_updated").text(" " + (new Date().toLocaleString()));
      } else {
        window.alert("Uh oh. Something went wrong.");
      }
    }).fail(function(error) {
      window.alert("Uh oh. Something went wrong.");
    });
  });
});
