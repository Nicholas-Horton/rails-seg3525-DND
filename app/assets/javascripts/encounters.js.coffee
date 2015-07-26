$(document).ready ->
  $('#add-monster-button').bind 'click', ->
    $('#creature-search-popup').toggle('slide', {direction: 'down'})
  $('#close-button').bind 'click', ->
    $('#creature-search-popup').toggle('slide', {direction: 'down'})
