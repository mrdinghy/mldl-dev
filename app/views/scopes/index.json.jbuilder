json.array!(@scopes) do |scope|
  json.extract! scope, :id, :name
  json.url scope_url(scope, format: :json)
end
