$(document).ready ->
  $('#login').bind 'click', ->
    $('#login-form').toggle('drop', {direction: 'up'})
