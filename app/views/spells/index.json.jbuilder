json.array!(@spells) do |spell|
  json.extract! spell, :id, :name, :description, :spell_class, :level, :school, :ritual, :casting_time, :components, :concentration, :source
  json.url spell_url(spell, format: :json)
end
