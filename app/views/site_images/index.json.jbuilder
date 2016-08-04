json.array!(@site_images) do |site_image|
  json.extract! site_image, :id, :name, :imageable_type, :imageable_id
  json.url site_image_url(site_image, format: :json)
end
