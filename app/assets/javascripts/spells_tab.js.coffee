$(document).ready ->
  $('#clear-all-button').bind "click", ->
    clearFields()
    filter()
  $(".spells_search_input").bind "keyup change", ->
    filter()

clearFields = () ->
  $("#name-search").val("")
  $('#spell-class').val("")
  $('#level').val("")
  $('#school').val("")
  $('#ritual').val("")
  $('#casting-time').val("")
  $('#components').val("")
  $('#concentration').val("")
  $('#source').val("")

filter = () ->
  name = $("#name-search").val().toLowerCase()
  spellClass = $('#spell-class').val()
  level = $('#level').val()
  school = $('#school').val()
  ritual = $('#ritual').val()
  castingTime = $('#casting-time').val()
  components = $('#components').val()
  concentration = $('#concentration').val()
  source = $('#source').val()

  matchingRows = $("#spells-feats-tabs #spells-tab #spell-table .spell-row")
  matchingRows = matchingRows.filter ->
    $(".name",this).text().toLowerCase().indexOf(name) != -1
  matchingRows = matchingRows.filter ->
    $(".spell-class",this).text().toLowerCase().indexOf(spellClass) != -1
  matchingRows = matchingRows.filter ->
    $(".level",this).text().toLowerCase().indexOf(level) != -1
  matchingRows = matchingRows.filter ->
    $(".school",this).text().toLowerCase().indexOf(school) != -1
  matchingRows = matchingRows.filter ->
    $(".ritual",this).text().toLowerCase().indexOf(ritual) != -1
  matchingRows = matchingRows.filter ->
    $(".casting-time",this).text().toLowerCase().indexOf(castingTime) != -1
  matchingRows = matchingRows.filter ->
    $(".components",this).text().toLowerCase().indexOf(components) != -1
  matchingRows = matchingRows.filter ->
    $(".concentration",this).text().toLowerCase().indexOf(concentration) != -1
  matchingRows = matchingRows.filter ->
    $(".source",this).text().toLowerCase().indexOf(source) != -1

  tableRows = $("#spells-feats-tabs #spells-tab #spell-table .spell-row")
  tableRows.hide()
  matchingRows.show()

  $("#spells-feats-tabs #spells-tab #spell-table .spell-row:visible:even").css('background-color', '#DDDDDD')
  $("#spells-feats-tabs #spells-tab #spell-table .spell-row:visible:odd").css('background-color', '#EEEEEE')