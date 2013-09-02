# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
	
tell = true
  
jQuery ->
  $('.unit').tooltip()
  
  color = $('.maintitle').css('background-color')
 
  $('#headinger').click ->
    $('.primary').css 'visibility', 'hidden'
    $('.page').animate({backgroundColor: 'black'})
    if tell
      $('#headinger').animate({fontSize: '100px'})
      $('#headinger').animate({color: 'red'})
      $('.maintitle').animate({backgroundColor: "black"})
      tell = false
    else
      $('#headinger').animate({color: '#ddd'})
      $('#headinger').animate({fontSize: '57px'})
      $('.page').animate({backgroundColor: '#ddd'})
      $('.maintitle').animate({backgroundColor: "#{color}"})
      $('.primary').css 'visibility', 'visible'
      tell = true