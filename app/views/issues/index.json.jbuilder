json.array!(@issues) do |issue|
  json.extract! issue, :id, :name, :description, :meeting_id, :structure_id, :district_id, :status_id, :status_note, :actionplan, :resolution_date
  json.url issue_url(issue, format: :json)
end
