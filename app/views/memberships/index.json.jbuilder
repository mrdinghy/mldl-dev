json.array!(@memberships) do |membership|
  json.extract! membership, :id, :person_id, :structure_id
  json.url membership_url(membership, format: :json)
end
