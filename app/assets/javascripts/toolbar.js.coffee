$(document).ready ->
  $('#dice-roller-button').bind 'click', ->
    $('#dice-roller').toggle('slide', {direction: 'down'})
    $('#dice-roller-button').toggleClass('activated')
    if ($('#spells-feats-button').hasClass('activated'))
      $('#spells-feats-collection').toggle('slide', {direction: 'down'})
      $('#spells-feats-button').toggleClass('activated')
    # TODO: diceroller doesn't scroll to bottom when opened
  $('#spells-feats-button').bind 'click', ->
    $('#spells-feats-collection').toggle('slide', {direction: 'down'})
    $('#spells-feats-button').toggleClass('activated')
    if ($('#dice-roller-button').hasClass('activated'))
      $('#dice-roller').toggle('slide', {direction: 'down'})
      $('#dice-roller-button').toggleClass('activated')