json.user_id image.user_id
json.image_url image.image_url
json.file_url rails_blob_url(image.file) if image.file.attachment