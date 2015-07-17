json.array!(@creatures) do |creature|
  json.extract! creature, :id, :name, :armor_class, :hitpoints, :speed, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :saving_throw, :damage_immunities, :condition_immunities, :senses, :languages, :challenge_rating, :experience, :description
  json.url creature_url(creature, format: :json)
end
