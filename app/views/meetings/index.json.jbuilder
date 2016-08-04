json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :meeting_on, :meeting_start, :meeting_end, :name, :structure_id
  json.url meeting_url(meeting, format: :json)
end
