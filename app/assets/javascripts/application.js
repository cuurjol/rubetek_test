// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require twitter/bootstrap
//= require twitter/bootstrap/alert
//= require_tree .

$(function () {
  let address_obj = $('#user_address')
  let address_val = address_obj.val();

  // https://stackoverflow.com/questions/44433953/jumping-scrollbar-after-auto-expanding-textarea
  let resizeTextarea = function(elem) {
    // two additional variables getting the top and left scroll positions.
    let scrollLeft = window.pageXOffset;
    let scrollTop  = window.pageYOffset;

    elem.css('height', 'auto').css('height', elem.prop('scrollHeight'));
    // Applying previous top and left scroll position after textarea resize.
    window.scrollTo(scrollLeft, scrollTop);
  };

  $('textarea').each(function() {
    $(this).on('input', function() {
      resizeTextarea($(this));
    });

    resizeTextarea($(this));
  });

  $('input:radio[name="user[role]"]').change(function () {
    debugger;
    if ($(this).val() === 'dweller') {
      address_obj.parent().removeClass('div-hidden');
      address_obj.val(address_val);
    } else {
      address_obj.parent().addClass('div-hidden');
      address_obj.val('');
    }
  });
});
