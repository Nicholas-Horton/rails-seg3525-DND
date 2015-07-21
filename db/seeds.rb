# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Spell.create(name: 'Acid Splash', description: 'You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a Dexterity saving throw or take 1d6 acid damage. This spells damage increases by 1d6 when you reach 5th level (2d6), 11th level (3d6) and 17th level (4d6).', spell_class: 'Sorcerer, Wizard', level: 0, school: 'Conjuration', ritual: false, casting_time: '1 action', components: 'V, S', concentration: false, source: 'PHB 211', range: '60 feet', duration: 'Instantaneous', material_components: nil)
Spell.create(name: 'Detect Magic', description: 'For the duration, you sense the presence of magic within 30 feet of you. If you sense magic in this way, you can use your action to see a faint aura around any visible creature or object in the area that bears magic, and you learn its school of magic, if any. The spell can penetrate most barriers, but is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.', spell_class: ' Bard, Cleric, Druid, Paladin, Ranger, Sorcerer, Warlock (The Machine), Wizard', level: 0, school: 'Divination', ritual: true, casting_time: '1 action', components: 'V, S', concentration: true, source: 'PHB 231', range: 'Self', duration: '10 minutes', material_components: nil)