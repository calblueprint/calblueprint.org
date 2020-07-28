$(document).on("page:load ready", function () {
  $("#save_button").on("click", function (e) {
    e.preventDefault();
    var endpoint = $(this).data("endpoint");
    var request = {
      method: "POST",
      url: endpoint,
      data: $('[id^="edit_nonprofit_application_"').serialize(),
      dataType: "json",
    };
    $.ajax(request)
      .done(function (response) {
        if (response.success) {
          $("#last_updated").text(" " + new Date().toLocaleString());
          toastr.success(
            "Application draft saved! Click the submit button if you wish to submit."
          );
        } else {
          window.alert("Uh oh. Something went wrong.");
        }
      })
      .fail(function (error) {
        window.alert("Uh oh. Something went wrong.");
      });

    return false;
  });
});
