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
//= require rails-ujs
//= require jquery
//= require jquery-ui
//= require turbolinks
//= require cocoon
//= require_tree .

function loadAutocomplete() {
  $jsAutocomplete = $('.js-autocomplete');
  $('form').find("input[data-autocomplete]").each(function() {
    var url;
    console.log(this);
    url = $(this).data('autocomplete');
    return $(this).autocomplete({
      minLength: 3,
      source: url,
      select: function( event, ui ) {
        $jsAutocomplete.val(ui.item.id);
      }
    });
  });
}

$(document).on('turbolinks:load', function() {
  loadAutocomplete();
  $('form').on('cocoon:after-insert', loadAutocomplete);
});
