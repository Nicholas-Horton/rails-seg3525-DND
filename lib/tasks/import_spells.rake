require 'json'

desc 'Import spells from json file'
task import_spells: [:environment] do

  file = File.read('public/data/spells.json')
  data = JSON.parse(file)
  data.each do |spell|
    name = spell['name']
    description = spell['desc'] + spell['higher_level']
    spell_class = spell['class']
    level = if spell['level'] == 'Cantrip' then '0' else spell['level'][0] end
    school = spell['school']
    ritual = spell['ritual'] == 'yes'
    casting_time = spell['casting_time']
    components = spell['components']
    concentration = spell['concentration'] == 'yes'
    source = spell['page']
    range = spell['range']
    duration = spell['duration']
    material_components = spell['material']

    Spell.create(name: name, description: description, spell_class: spell_class, level: level, school: school, ritual: ritual, casting_time: casting_time, components: components, concentration: concentration, source: source, range: range, duration: duration, material_components: material_components)
  end

end