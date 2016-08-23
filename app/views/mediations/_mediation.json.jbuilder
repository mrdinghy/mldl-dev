json.extract! mediation, :id, :name, :issue_id, :mediation_start, :mediation_end, :mediation_notes, :created_at, :updated_at
json.url mediation_url(mediation, format: :json)