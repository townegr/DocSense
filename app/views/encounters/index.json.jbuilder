json.array!(@encounters) do |encounter|
  json.extract! encounter, :id, :patient_name
  json.start encounter.start_date
  json.end encounter.end_date
  json.url encounter_path(encounter, format: :html)
end
