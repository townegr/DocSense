json.array!(@encounters) do |encounter|
  json.extract! encounter, :patient_name, :insurance_provider, :notes, :physician_fee
  json.start encounter.created_at
  json.end encounter.created_at
  json.title encounter.patient_name
  json.url encounters_path(encounter, format: :html)
end
