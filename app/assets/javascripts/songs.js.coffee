# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $button = $('.btn.btn-primary.kind')
  $button.click ->
    value =  $(this).attr('title')
    $('#song_category_id').val(value)

  $('#close-and-delete').live 'click', ->
    #if (confirm("Are you sure?"))
      id = $(this).attr('title')
      href = "songs/" + id
      $.post(href, { _method: 'delete' }, null, "script");
      return false
    #else
    #return false
  
  ###
  $(".toggled-checkbox").hide()
  $(".btn.btn-primary.kind").click -> 
    $(".toggled-checkbox").hide() 
  $(".btn.btn-primary.kind.joint").click -> 
    $(".toggled-checkbox").show() 
  ###

  $("#tabs").tab()
