json.array!(@actiontypes) do |actiontype|
  json.extract! actiontype, :id, :name
  json.url actiontype_url(actiontype, format: :json)
end
