$(document).ready ->
  $('#add-monster-button').bind 'click', ->
    $('#creature-search-popup').toggle('slide', {direction: 'down'})
  $('#close-button').bind 'click', ->
    $('#creature-search-popup').toggle('slide', {direction: 'down'})    
  addDeleteSpellButtons()
  $('#fieldset-wrapper .spells .add-button').bind 'click', openSpellTab
  $('#fieldset-wrapper .spells .remove-button').bind 'click', toggleRemoveSpells
  $('body').on 'mouseenter', '.spells .spell + .delete', addDeleteWarning
  $('body').on 'mouseleave', '.spells .spell + .delete', removeDeleteWarning
  $('body').on 'click', '.spells .spell + .delete', removeSpell
  $('body').on 'click', '#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button', addSpell
  if $('input#page-info').val() == 'show_encounter'
    addAddSpellButtons()
    addTempSpells()

addDeleteSpellButtons = () ->
  $('#fieldset-wrapper .spells .spell').after("<div class='delete'><i class='fa fa-minus-circle'></i>Delete</div>")

openSpellTab = () ->
  $('#spells-feats-button').click()
  $('.spells-feats-tab-label').first().click()

toggleRemoveSpells = () ->
  if $('#fieldset-wrapper .spells .spell + .delete').css('visibility') == 'hidden'
    $('#fieldset-wrapper .spells .spell + .delete').css('visibility', 'visible')
  else
    $('#fieldset-wrapper .spells .spell + .delete').css('visibility', 'hidden')

rearrangeSpells = () ->
  spells = $('#fieldset-wrapper .spells .spell').parent()
  spells.detach()
  spells.sort (a,b) ->
    nA = $('.spell', a).text()
    nB = $('.spell', b).text()
    if nA < nB then -1 else if nA > nB then 1 else 0
  $('#fieldset-wrapper .spells .spell-column').remove()
  numberPerColumn = Math.ceil(spells.length / 2)
  n = 0
  for s in spells
    if n % numberPerColumn == 0
      $('#fieldset-wrapper .spells').append("<div class='spell-column'></div>")
    $('#fieldset-wrapper .spells .spell-column:last').append(s)
    n++

addDeleteWarning = (e) ->
  $('.spell-block').removeClass('delete-warning')
  $(e.target).parent().addClass('delete-warning')

removeDeleteWarning = (e) ->
  $('.spell-block').removeClass('delete-warning')

removeSpell = (e) ->
  $(e.target).parent().remove()
  rearrangeSpells()

addSpell = (e) ->
  spellRow = $(e.target).closest('.spell-row')
  spellName = $('.name', spellRow).text()
  spellId = $('.name', spellRow).attr('spell_id')
  if $('#fieldset-wrapper .spells .spell').text().indexOf(spellName) == -1
    spell = "<div class='spell-block'><div class='spell' spell_id='#{spellId}'>#{spellName}</div><div class='delete'><i class='fa fa-minus-circle'></i>Delete</div></div>"
    $('#fieldset-wrapper .spells').append(spell)
    rearrangeSpells()
    showSpellAddMessage(spellRow, 'Spell successfully added.')
  else
    showSpellAddMessage(spellRow, 'Spell is already on spell list!')

showSpellAddMessage = (row, message) ->
#  todo: add message

addAddSpellButtons = () ->
  $('#spells-feats-tabs #spells-tab #spell-table tr:first').prepend("<th class='add-button-header'></th>")
  spells = $('#spells-feats-tabs #spells-tab #spell-table .spell-row')
  spells.prepend("<td class='add-button'><i class='fa fa-plus-circle fa-2x'></i></td>")

#  TODO: remove when implementing player
addTempSpells = () ->
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(22).click()
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(55).click()

 