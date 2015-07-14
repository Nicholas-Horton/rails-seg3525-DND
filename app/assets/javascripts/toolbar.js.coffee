$(document).ready ->
  $('#dice-roller-button').bind 'click', ->
    $('#dice-roller').toggle()
    $('#dice-roller-button').toggleClass('activated')




