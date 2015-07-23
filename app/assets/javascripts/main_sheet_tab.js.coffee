$(document).ready ->
  calculateAttributes()
  $(".ability_score").bind "keyup change", ->
    calculateAttributes()
  addDeleteSpellButtons()
  $("#attack-spell-wrapper .spells .add-button").bind "click", ->
    addSpell()
  $("#attack-spell-wrapper .spells .remove-button").bind "click", ->
    toggleRemoveSpells()
  rearrangeSpells()
  $('.spells .spell + .delete').hover addDeleteWarning, removeDeleteWarning
  $('.spells .spell + .delete').bind 'click', (e) ->
    removeSpell(e)
  if $('input#page-info').val() == 'player_character'
    addAddSpellButtons()

calculateAttributes = () ->
  strength = $("#strength").val()
  dexterity = $("#dexterity").val()
  constitution = $("#constitution").val()
  intelligence = $("#intelligence").val()
  wisdom = $("#wisdom").val()
  charisma = $("#charisma").val()

  if (strength >= 10)
    $('#strength_modifier').val("+" + Math.floor(((strength - 10)/2)))
  else
    $('#strength_modifier').val(Math.floor(((strength - 10)/2)))

  if (dexterity >= 10)
    $('#dexterity_modifier').val("+" + Math.floor(((dexterity - 10)/2)))
  else
    $('#dexterity_modifier').val(Math.floor(((dexterity - 10)/2)))

  if (constitution >= 10)
    $('#constitution_modifier').val("+" + Math.floor(((constitution - 10)/2)))
  else
    $('#constitution_modifier').val(Math.floor(((constitution - 10)/2)))

  if (intelligence >= 10)
    $('#intelligence_modifier').val("+" + Math.floor(((intelligence - 10)/2)))
  else
    $('#intelligence_modifier').val(Math.floor(((intelligence - 10)/2)))

  if (wisdom >= 10)
    $('#wisdom_modifier').val("+" + Math.floor(((wisdom - 10)/2)))
  else
    $('#wisdom_modifier').val(Math.floor(((wisdom - 10)/2)))

  if (charisma >= 10)
    $('#charisma_modifier').val("+" + Math.floor(((charisma - 10)/2)))
  else
    $('#charisma_modifier').val(Math.floor(((charisma - 10)/2)))

addDeleteSpellButtons = () ->
  $('#attack-spell-wrapper .spells .spell').after("<div class='delete'><i class='fa fa-minus-circle'></i>Delete</div>")

addSpell = () ->
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

addAddSpellButtons = () ->
  $('#spells-feats-tabs #spells-tab #spell-table tr:first').prepend("<th class='add-button-header'></th>")
  spells = $('#spells-feats-tabs #spells-tab #spell-table .spell-row')
  spells.prepend("<td class='add-button'><i class='fa fa-plus-circle fa-2x'></i></td>")
