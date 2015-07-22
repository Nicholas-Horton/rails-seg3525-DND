$(document).ready ->
  calculateAttributes()
  $(".ability_score").bind "keyup change", ->
    calculateAttributes()
  addDeleteSpellButtons()
  $("#attack-spell-wrapper .spells .remove-button").bind "click", ->
    toggleRemoveSpells()


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
  $('#attack-spell-wrapper .spells .spell').after("<div class='delete td'><i class='fa fa-minus-circle'></i>Delete</div>")

toggleRemoveSpells = () ->
  if $('#attack-spell-wrapper .spells .spell + .delete').css('visibility') == 'hidden'
    $('#attack-spell-wrapper .spells .spell + .delete').css('visibility', 'visible')
  else
    $('#attack-spell-wrapper .spells .spell + .delete').css('visibility', 'hidden')
