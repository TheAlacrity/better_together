json.id image.id
json.user_id image.user_id
json.default_image_url image.default_image_url
json.image_url image.image_url
json.file_url rails_blob_url(image.file) if image.file.attachment