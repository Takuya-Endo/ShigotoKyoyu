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
    $('.event-add-btn-css').mouseover(function(){
      $('.event-add-btn-css').addClass('event-add-btn-hover');
    });
    $('.event-add-btn-css').mouseout(function(){
      $('.event-add-btn-css').removeClass('event-add-btn-hover');
    });
  });
});

document.addEventListener("turbolinks:load", function () {
  $(function(){
    $('.new-appointment-btn-css').mouseover(function(){
      $('.new-appointment-btn-css').addClass('new-appointment-btn-hover');
    });
    $('.new-appointment-btn-css').mouseout(function(){
      $('.new-appointment-btn-css').removeClass('new-appointment-btn-hover');
    });
  });
});

document.addEventListener("turbolinks:load", function () {
  $(function(){
    $('.new-meeting-btn-css').mouseover(function(){
      $('.new-meeting-btn-css').addClass('new-meeting-btn-hover');
    });
    $('.new-meeting-btn-css').mouseout(function(){
      $('.new-meeting-btn-css').removeClass('new-meeting-btn-hover');
    });
  });
});

document.addEventListener("turbolinks:load", function () {
  $(function(){
    $('.new-task-btn-css').mouseover(function(){
      $('.new-task-btn-css').addClass('new-task-btn-hover');
    });
    $('.new-task-btn-css').mouseout(function(){
      $('.new-task-btn-css').removeClass('new-task-btn-hover');
    });
  });
});