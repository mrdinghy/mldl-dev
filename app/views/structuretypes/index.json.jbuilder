json.array!(@structuretypes) do |structuretype|
  json.extract! structuretype, :id, :name
  json.url structuretype_url(structuretype, format: :json)
end
