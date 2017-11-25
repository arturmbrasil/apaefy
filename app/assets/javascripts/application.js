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
//= require jquery3
//= require tether
//= require bootstrap
//= require jquery-mask
//= require Chart.bundle
//= require chartkick
//= require select2
//= require select2_locale_pt-BR

$(function () {

  // ------------------------------------------------------- //
  // Card Close
  // ------------------------------------------------------ //
  $('.card-close a.remove').on('click', function (e) {
    e.preventDefault();
    $(this).parents('.card').fadeOut();
  });

  // ------------------------------------------------------- //
  // Adding fade effect to dropdowns
  // ------------------------------------------------------ //
  $('.dropdown').on('show.bs.dropdown', function () {
    $(this).find('.dropdown-menu').first().stop(true, true).fadeIn();
  });
  $('.dropdown').on('hide.bs.dropdown', function () {
    $(this).find('.dropdown-menu').first().stop(true, true).fadeOut();
  });

  // ------------------------------------------------------- //
  // Sidebar Functionality
  // ------------------------------------------------------ //
  $('#toggle-btn').on('click', function (e) {
    e.preventDefault();
    $(this).toggleClass('active');

    $('.side-navbar').toggleClass('shrinked');
    $('.content-inner').toggleClass('active');

    if ($(window).outerWidth() > 1183) {
      if ($('#toggle-btn').hasClass('active')) {
        $('.navbar-header .brand-small').hide();
        $('.navbar-header .brand-big').show();
      } else {
        $('.navbar-header .brand-small').show();
        $('.navbar-header .brand-big').hide();
      }
    }

    if ($(window).outerWidth() < 1183) {
      $('.navbar-header .brand-small').show();
    }
  });

  // ------------------------------------------------------- //
  // Transition Placeholders
  // ------------------------------------------------------ //
  $('input.input-material').each(function () {
    if ($(this).val() !== '') {
      $(this).siblings('.label-material').addClass('active');
    }
  });

  $('input.input-material').on('focus', function () {
    $(this).siblings('.label-material').addClass('active');
  });

  $('input.input-material').on('blur', function () {
    $(this).siblings('.label-material').removeClass('active');

    if ($(this).val() !== '') {
      $(this).siblings('.label-material').addClass('active');
    } else {
      $(this).siblings('.label-material').removeClass('active');
    }
  });

  // Bootstrap alert close button
  $('.alert').alert();

  // State & City Select

  var fetchCities = function(stateId, fn) {
    $.get('/api/states/' + stateId + '/cities', function(result) {
      fn(result);
    });
  };

  var buildCitiesOptions = function(cities) {
    var options = [];
    for (var i = 0; i < cities.length; i++) {
      var el = document.createElement('option');
      el.value = cities[i].id;
      el.text = cities[i].name;
      options.push(el);
    }

    return options;
  };

  $('.js-state-select').on('change', function() {
    fetchCities(this.value, function (cities) {
      var options = buildCitiesOptions(cities);
      $('.js-city-select').html(options);
    });
  });

  // JQuery Mask
  var phoneMaskBehavior = function(val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  };
  var phoneMaskOptions = {
    onKeyPress: function(val, e, field, options) {
      field.mask(phoneMaskBehavior.apply({}, arguments), options);
    }
  };

  $('.js-document-cpf').mask('000.000.000-00', { reverse: true });
  $('.js-document-cnpj').mask('00.000.000/0000-00', { reverse: true });
  $('.js-phone-number').mask(phoneMaskBehavior, phoneMaskOptions);
  $('.js-address-zip-code').mask('00000-000');
  $('.js-license-plate').mask('AAA-0000');
  $('.js-currency').mask('000.000.000.000.000,00', { reverse: false });


  // Remote forms helpers
  $.fn.renderFormErrors = function(errors) {
    var form = this;
    var modelName = $(this).data('model');
    this.clearFormErrors();
    return $.each(errors, function(field, messages) {
      var input;
      input = form.find('input, select, textarea').filter(function() {
        var name;
        name = $(this).attr('name');
        if (name) {
          return name.match(new RegExp(modelName + '\\[' + field + '\\(?'));
        }
      });
      input.closest('.form-group').addClass('has-danger');
      return input.parent().append('<div class="form-control-feedback">' + $.map(messages, function(m) {
        return m.charAt(0).toUpperCase() + m.slice(1);
      }).join('<br />') + '</div>');
    });
  };

  $.fn.clearFormErrors = function() {
    this.find('.form-group').removeClass('has-danger');
    return this.find('div.form-control-feedback').remove();
  };

  $.fn.clearFormFields = function() {
    return this.find(':input', '#myform').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
  };

  // Remote forms on error
  $('form[data-remote=true]').on('ajax:error', function(event) {
    $(this).renderFormErrors(event.detail[0]);
  });

  $('form[data-remote=true]').on('ajax:success', function(event) {
    location.reload();
  });

  $( "#select2" ).select2({
    language: "pt-BR",
    theme: "bootstrap"
  });
});
