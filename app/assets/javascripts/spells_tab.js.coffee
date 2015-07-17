$(document).ready ->
  $(".spells_search_input").bind "keyup change", ->
    name = $("#name-search").val().toLowerCase()
    spellClass = $('#spell-class').val()
    level = $('#level').val()
    school = $('#school').val()
    ritual = $('#ritual').val()
    castingTime = $('#casting-time').val()
    components = $('#components').val()
    concentration = $('#concentration').val()
    source = $('#source').val()

    matchingRows = $("tr.spell-row")
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

    tableRows = $("tr.spell-row")
    tableRows.hide()
    matchingRows.show()