# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
	
tell = true
  
jQuery ->
  $('.unit').tooltip()
  
  color = $('.maintitle').css('background-color')
 
  $('#headinger').click ->
    $('#devil').css 'display', 'block'
    $('#devil').css 'text-align', 'center'
    $('.primary').css 'visibility', 'hidden'
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
      $('.page').animate({backgroundColor: '#ddd'})
      $('.maintitle').animate({backgroundColor: "#{color}"})
      $('.primary').css 'visibility', 'visible'
      $('#devil').animate({opacity: "0"})
      tell = true