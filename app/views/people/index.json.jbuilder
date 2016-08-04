json.array!(@people) do |person|
  json.extract! person, :id, :name_first, :name_last, :email
  json.url person_url(person, format: :json)
end
