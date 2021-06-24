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

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


/*global $*/
document.addEventListener("turbolinks:load", function () {
  $(function(){
    $('.apply-btn-css').mouseover(function(){
      $(this).addClass('apply-btn-hover');
    });
    $('.apply-btn-css').mouseout(function(){
      $(this).removeClass('apply-btn-hover');
    });
  });
});

document.addEventListener("turbolinks:load", function () {
  $(function(){
    $('.cancel-btn-css').mouseover(function(){
      $(this).addClass('cancel-btn-hover');
    });
    $('.cancel-btn-css').mouseout(function(){
      $(this).removeClass('cancel-btn-hover');
    });
  });
});