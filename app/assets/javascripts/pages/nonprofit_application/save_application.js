$(document).on( "page:load ready", function() {
  console.log("ready");
  $("#save_button").on("click", function(e) {
    var endpoint = $(this).data("endpoint");
    var request = {
      method: "POST",
      url: endpoint,
      data: $('[id^="edit_nonprofit_application_"').serialize(),
      dataType: "json"
    };
    console.log(request);
    $.ajax(request).done(function(response) {
      if (response.success) {
        $("#last_updated").text(" " + (new Date().toLocaleString()));
      } else {
        console.log(response);
        window.alert("Uh oh. Something went wrong.");
      }
    }).fail(function(error) {
      console.log(error);
      window.alert("Uh oh. Something went wrong.");
    });
  });
});
