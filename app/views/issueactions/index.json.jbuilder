json.array!(@issueactions) do |issueaction|
  json.extract! issueaction, :id, :actiontype_id, :meeting_id, :organization_id, :issue_id, :actionbody
  json.url issueaction_url(issueaction, format: :json)
end
