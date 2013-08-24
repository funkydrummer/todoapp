// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {
  var inputWdith = '450px';
  var inputWdithReturn = '200px';     

  $('#input-in-nav').focus(function(){
      if($(this).val()=='Enter text here...'){
          $(this).val('');
      }
      
      //animate the box
      $(this).animate({
          width: inputWdith
      }, 400 )
  }); 

  /* TEMPORARY FIX */
  /*
  $('#input-in-nav').blur(function(){
      if($(this).val()==''){
          $(this).val('Enter text here...');
      }
      
      $(this).animate({
          width: inputWdithReturn
      }, 500 )
          
  });
*/
  $('.btn.edit').hide();
  $('div.alert.alert-white').mouseover(function() {
    $(this).find('.btn.edit').show();
  }).mouseout(function(){
    $(this).find('.btn.edit').hide();
  });
});

/*
*/
