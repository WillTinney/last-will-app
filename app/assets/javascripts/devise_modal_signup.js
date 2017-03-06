$("form#sign_up_user").bind("ajax:success", function(e, data, status, xhr) {
  if (data.success) {
    $('#sign_up').modal('hide');
    $('#sign_up_button').hide();
    return $('#submit_comment').slideToggle(1000, "easeOutBack");
  } else {
    return alert('failure!');
  }
});
