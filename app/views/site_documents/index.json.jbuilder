json.array!(@site_documents) do |site_document|
  json.extract! site_document, :id, :name
  json.url site_document_url(site_document, format: :json)
end
