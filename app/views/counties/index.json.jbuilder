json.array!(@counties) do |county|
  json.extract! county, :id, :name
  json.url county_url(county, format: :json)
end
