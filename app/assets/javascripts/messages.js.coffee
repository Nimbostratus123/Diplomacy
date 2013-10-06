# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  
  $('.letter').parent().children().children('div').hide()
  
  $('.letter').click ->
    $(this).siblings('.letter').children('div').slideUp()
    $(this).children('div').slideToggle()