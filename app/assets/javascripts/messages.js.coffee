# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  
  $('.letter').parent().children().children('div').hide()
  $('.form').draggable()
  
  $('.letter').click ->
    $(this).siblings('.letter').children('div').slideUp()
    $(this).children('div').slideToggle()
    if window.location.pathname == '/messages'
      $.post("/messages/#{$(this).data('id')}/seen")
 
    
  $('.form').hide()
  
  $('#fade').css('display', 'none')
  
  $('#toplist').click ->
    $('.form').show()
    $('#fade').css('display', 'block')
    $('#fade').css('opacity', '0')
    $('#fade').animate({opacity: 0.7})
    
  $('#submit').click ->
    unless $('.field').val()
      tell = confirm "There is no subject. Do you still want to send the message?"
      if tell
        $('.form form').submit()
      else
        $('#fade').animate({opacity: 0.5})
        $('#fade').animate({opacity: 0.7})
    else
      $('.form form').submit()
  
  $('#fade').click ->
    $('.form').hide()
    $('#fade').css('display', 'none')
    
  $('#sent').click ->
    window.location.href = '/messages/sent'
    
  $('#inbox').click ->
    window.location.href = '/messages'
    
  $('#read').click ->
    window.location.href = '/messages/read'
    
  $('#bottomlist').click ->
    window.location.href = '/'