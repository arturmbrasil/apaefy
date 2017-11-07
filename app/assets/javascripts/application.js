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
//= require_tree .

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
});
