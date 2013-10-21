var SubmitEmail = function() {
  var $overlay = $('#success-overlay');

  $('#email-submit-form').on('ajax:success', function() {
    var $form = $(this);
    var $input = $form.find('#lead_email').first();
    $input.val('');
    $input.blur();
    
    $overlay.fadeIn();
  });
};