json.array!(@communities) do |community|
  json.extract! community, :id, :name, :district_id
  json.url community_url(community, format: :json)
end
