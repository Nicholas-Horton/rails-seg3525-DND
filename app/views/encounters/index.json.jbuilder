json.array!(@encounters) do |encounter|
  json.extract! encounter, :id, :campaign_id, :name
  json.url encounter_url(encounter, format: :json)
end
