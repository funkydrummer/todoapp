# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $button = $('.btn.btn-primary.kind')
  $button.click ->
    value =  $(this).attr('title')
    $('#item_category_id').val(value)

  $('#close-and-delete').live 'click', ->
    id = $(this).attr('title')
    href = "items/" + id
    $.post(href, { _method: 'delete' }, null, "script");
    return false

  $('.js-assign-color').live 'click', ->
    color = $(this).data('color')
    itemId = $(this).data('id')
    href = 'items/' + itemId + '/color' + '?set=' + color
    $.get(href)
  
  $('.js-non-deletable').live 'click', ->
    value = $(this).data('value')
    itemId = $(this).data('id')
    href = 'items/' + itemId + '/non_deletable' + '?set=' + value 
    $.get(href)

  $('.js-hidden').live 'click', ->
    value = $(this).data('value')
    itemId = $(this).data('id')
    href = 'items/' + itemId + '/hide' + '?set=' + value 
    $.get(href)

  $("#tabs").tab()

  $('.items-list').sortable(
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  )
