json.extract! agenda, :id, :meeting_id, :issue_id, :result_id, :agenda_note, :created_at, :updated_at
json.url agenda_url(agenda, format: :json)