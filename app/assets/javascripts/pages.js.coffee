# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
	
tell = true
  
jQuery ->
  $('.unit').tooltip()
  
  color = $('.maintitle').css('background-color')
 
  $('#headinger').click ->
    $('.primary').animate({opacity: '0'})
    $('#dialog').parent().css 'display', 'none'
    $('#devil').css 'display', 'block'
    $('.primary').animate({visibility: 'hidden'})
    $('#devil').css 'visibility', 'hidden'
    $('.page').animate({backgroundColor: 'black'})
    if tell
      $('#headinger').animate({fontSize: '100px'})
      $('#headinger').animate({color: 'red'})
      $('.maintitle').animate({backgroundColor: "black"})
      $('#devil').animate({opacity: "1"})
      tell = false
    else
      $('#headinger').animate({color: '#ddd'})
      $('#headinger').animate({fontSize: '57px'})
      $('#devil').css 'visibility', 'visible'
      $('#devil').animate({opacity: "0"})
      $('.primary').animate({opacity: '1'})
      $('.page').animate({backgroundColor: '#ddd'})
      $('.maintitle').animate({backgroundColor: "#{color}"})
      tell = true
