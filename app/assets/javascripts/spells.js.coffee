$(document).ready ->
  $('.spell').hover showSpellTooltip, hideSpellTooltip
  $('.spell').bind 'mousemove', moveSpellTooltip

showSpellTooltip = (e) ->
  hideAllSpellTooltips()
  id = $(e.target).closest('.spell').attr('spell_id')
  if $("#spell-tooltip-#{id}").length == 0
    $.ajax
      type: 'get'
      url: '/spells/get_spell'
      data:
        spell_id: id
      success: (data) ->
        spellInfo = JSON.parse(data)
        $('body').append("<div id='spell-tooltip-#{id}' class='spell-tooltip'></div>")
        fillSpellTooltip(id, spellInfo)
        $("#spell-tooltip-#{id}").show()
        fixSpellDetailsHeights(id)
        moveSpellTooltip(e)
  $("#spell-tooltip-#{id}").show()

hideAllSpellTooltips = () ->
  $("[id^=spell-tooltip-]").hide()

hideSpellTooltip = (e) ->
  id = $(e.target).closest('.spell').attr('spell_id')
  $("#spell-tooltip-#{id}").hide()

moveSpellTooltip = (e) ->
  id = $(e.target).closest('.spell').attr('spell_id')
  tooltip = $("#spell-tooltip-#{id}")
  tooltip.css('left', e.pageX + 20)
  tooltip.css('top', e.pageY - tooltip.height()/2)

fillSpellTooltip = (id, spellInfo) ->
  tooltip = $("#spell-tooltip-#{id}")
  contents = ""
  contents += "<div class='spell-tooltip-content'>"
  name = spellInfo.spellName
  if spellInfo.ritual
    name += ' (Ritual)'
  contents += "<div class='spell-name'>#{name}</div>"
  contents += "<div class='spell-casting-time'><div class='title'>Casting Time</div>#{spellInfo.spellCastingTime}</div>"
  contents += "<div class='spell-range'><div class='title'>Range</div>#{spellInfo.spellRange}</div>"
  contents += "<div class='spell-components'><div class='title'>Components</div>#{spellInfo.spellComponents}</div>"
  duration = ''
  if spellInfo.concentration
    duration += 'Concentration, '
  duration += spellInfo.spellDuration
  contents += "<div class='spell-duration'><div class='title'>Duration</div>#{duration}</div>"
  contents += "<div class='spell-material-components'>#{spellInfo.spellMaterialComponents || ''}</div>"
  contents += "<div class='spell-description'>#{spellInfo.spellDescription}</div>"
  contents += "</div>"
  contents += "<div class='spell-class'>#{spellInfo.spellClass}</div>"
  l = ''
  if spellInfo.spellLevel == 0
    l = "#{spellInfo.spellSchool} Cantrip"
  else
    l = "Level #{spellInfo.spellLevel} #{spellInfo.spellSchool}"
  contents += "<div class='spell-level'>#{l}</div>"
  tooltip.html(contents)

fixSpellDetailsHeights = (id) ->
  tooltip = $("#spell-tooltip-#{id}")
  castingTime = $('.spell-casting-time', tooltip)
  range = $('.spell-range', tooltip)
  components = $('.spell-components', tooltip)
  duration = $('.spell-duration', tooltip)

  castingTime.height(Math.max(castingTime.height(), range.height()))
  range.height(Math.max(castingTime.height(), range.height()))
  components.height(Math.max(components.height(), duration.height()))
  duration.height(Math.max(components.height(), duration.height()))