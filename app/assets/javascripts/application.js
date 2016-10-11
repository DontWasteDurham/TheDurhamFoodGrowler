// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require jquery_ujs
//= require_tree .
//= require tether
//= require bootstrap
//= require cable
//= require turbolinks
jQuery(document).on('turbolinks:load', function() {
  $('input#box_number').on("change paste keyup", function() {
    $('h3#plan-amount').text(function() {
      plan_amount = '$' + (($('input#box_number').val() * 5) + 20) + '.00';
      return plan_amount;
    });
  });
  $('input#add_box_number').on("change paste keyup", function() {
    $('h3#charge-amount').text(function() {
      charge_amount = '$' + ($('input#add_box_number').val() * 5) + '.00';
      return charge_amount;
    });
  });
});
