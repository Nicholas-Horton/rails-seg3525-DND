$(document).ready ->
  $('#dice-roller-button').bind 'click', ->
    $('#dice-roller').toggle('slide', {direction: 'down'})
    $('#dice-roller-button').toggleClass('activated')




