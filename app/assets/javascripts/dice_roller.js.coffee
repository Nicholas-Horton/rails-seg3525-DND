$(document).ready ->
  $('#roll-dice').bind 'click', ->
    rollDice()
  $('#clear-dice').bind 'click', ->
    clearDice()
  $('#dice-roller-input').bind 'keyup', (e) ->
    rollInputChanged(e)


rollDice = () ->
  formula = ""
  for d in [4, 6, 8, 10, 12, 20]
    amount = $('#d'+d+'-amount').val()
    if amount > 0
      if formula != ''
        formula += '+'
      formula += amount + 'd' + d
      modifier = $('#d'+d+'-modifier').val()
      if modifier != ''
        formula += modifier
  submitDiceRoll(formula)

clearDice = () ->
  $("[id$='-amount']").val('')
  $("[id$='-modifier']").val('')

rollInputChanged = (e) ->
  if e.keyCode == 13
    formula = $('#dice-roller-input').val().replace(/\s/g, '')
    submitDiceRoll(formula)

submitDiceRoll = (formula) ->
  if validFormula formula
    formulaResult = evaluateFormula formula
    formula = formula.replace(/\+/g, ' + ')
    formula = formula.replace(/-/g, ' - ')
    result = ""
    if $('#dice-roller-output').val() != ''
      result += "----------------------------------\n"
    result += formula + "\n" + "  = " + formulaResult + "\n"
    $('#dice-roller-output').append result
    $('#dice-roller-output').scrollTop($('#dice-roller-output')[0].scrollHeight)

validFormula = (formula) ->
  regex = /^((\d*d\d+)|(\d+))((\+|-)((\d*d\d+)|(\d+)))*$/
  regex.test formula

evaluateFormula = (formula) ->
  result = formula.split(/\+|-/)
  operations = (s for s in formula when s == '+' || s == '-')
  result = result.map evaluateDie
  exp = ""
  for i in [0..result.length-1]
    exp += result[i]
    if i != result.length - 1
      exp += operations[i]
  eval(exp)

evaluateDie = (die) ->
  if die.indexOf('d') == -1
    return parseInt(die)
  data = die.split('d')
  n = 1
  if data[0] != ''
    n = data[0]
  d = data[data.length - 1]
  sum = 0
  sum += Math.floor((Math.random()*d)+1) for i in [0..n-1]
  sum


