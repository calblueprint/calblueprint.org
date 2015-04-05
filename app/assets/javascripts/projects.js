$( document ).on('page:change', function() {
  $( ".project-see-more" ).click(function () {
    var expand = $(this).parent().parent().children(".project-expand")
    if (expand.is( ":hidden" ) ) {
      expand.slideDown( "slow" );
    } else {
      expand.slideUp( "slow" );
    }
  });
});

