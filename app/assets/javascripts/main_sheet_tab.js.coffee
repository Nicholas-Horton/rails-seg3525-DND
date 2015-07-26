$(document).ready ->
  calculateAttributes()
  $(".ability_score").bind "keyup change", ->
    calculateAttributes()
  addDeleteSpellButtons()
  $('#attack-spell-wrapper .spells .add-button').bind 'click', openSpellTab
  $('#attack-spell-wrapper .spells .remove-button').bind 'click', toggleRemoveSpells
  $('body').on 'mouseenter', '.spells .spell + .delete', addDeleteWarning
  $('body').on 'mouseleave', '.spells .spell + .delete', removeDeleteWarning
  $('body').on 'click', '.spells .spell + .delete', removeSpell
  $('body').on 'click', '#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button', addSpell
  if $('input#page-info').val() == 'player_character'
    addAddSpellButtons()
    addTempSpells()

calculateAttributes = () ->
  strength = $('#strength').val()
  dexterity = $('#dexterity').val()
  constitution = $('#constitution').val()
  intelligence = $('#intelligence').val()
  wisdom = $('#wisdom').val()
  charisma = $('#charisma').val()

  if (strength >= 10)
    $('#strength_modifier').val('+' + Math.floor(((strength - 10)/2)))
  else
    $('#strength_modifier').val(Math.floor(((strength - 10)/2)))

  if (dexterity >= 10)
    $('#dexterity_modifier').val('+' + Math.floor(((dexterity - 10)/2)))
  else
    $('#dexterity_modifier').val(Math.floor(((dexterity - 10)/2)))

  if (constitution >= 10)
    $('#constitution_modifier').val('+' + Math.floor(((constitution - 10)/2)))
  else
    $('#constitution_modifier').val(Math.floor(((constitution - 10)/2)))

  if (intelligence >= 10)
    $('#intelligence_modifier').val('+' + Math.floor(((intelligence - 10)/2)))
  else
    $('#intelligence_modifier').val(Math.floor(((intelligence - 10)/2)))

  if (wisdom >= 10)
    $('#wisdom_modifier').val('+' + Math.floor(((wisdom - 10)/2)))
  else
    $('#wisdom_modifier').val(Math.floor(((wisdom - 10)/2)))

  if (charisma >= 10)
    $('#charisma_modifier').val('+' + Math.floor(((charisma - 10)/2)))
  else
    $('#charisma_modifier').val(Math.floor(((charisma - 10)/2)))

addDeleteSpellButtons = () ->
  $('#attack-spell-wrapper .spells .spell').after("<div class='delete'><i class='fa fa-minus-circle'></i>Delete</div>")

openSpellTab = () ->
  $('#spells-feats-button').click()
  $('.spells-feats-tab-label').first().click()

toggleRemoveSpells = () ->
  if $('#attack-spell-wrapper .spells .spell + .delete').css('visibility') == 'hidden'
    $('#attack-spell-wrapper .spells .spell + .delete').css('visibility', 'visible')
  else
    $('#attack-spell-wrapper .spells .spell + .delete').css('visibility', 'hidden')

rearrangeSpells = () ->
  spells = $('#attack-spell-wrapper .spells .spell').parent()
  spells.detach()
  spells.sort (a,b) ->
    nA = $('.spell', a).text()
    nB = $('.spell', b).text()
    if nA < nB then -1 else if nA > nB then 1 else 0
  $('#attack-spell-wrapper .spells .spell-column').remove()
  numberPerColumn = Math.ceil(spells.length / 4)
  n = 0
  for s in spells
    if n % numberPerColumn == 0
      $('#attack-spell-wrapper .spells').append("<div class='spell-column'></div>")
    $('#attack-spell-wrapper .spells .spell-column:last').append(s)
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
  spellRow = $(e.target).parent().parent()
  spellName = $('.name', spellRow).text()
  spellId = $('.name', spellRow).attr('spell_id')
  if $('#attack-spell-wrapper .spells .spell').text().indexOf(spellName) == -1
    spell = "<div class='spell-block'><div class='spell' spell_id='#{spellId}'>#{spellName}</div><div class='delete'><i class='fa fa-minus-circle'></i>Delete</div></div>"
    $('#attack-spell-wrapper .spells').append(spell)
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
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(88).click()
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(111).click()
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(222).click()
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(333).click()
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(344).click()
  $('#spells-feats-tabs #spells-tab #spell-table .spell-row .add-button i').eq(355).click()

