json.array! @images.each do |image|
  json.user_id image.user_id
  json.file rails_blob_url(image.file) if image.file.attachment
end