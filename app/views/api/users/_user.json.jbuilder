json.id user.id
json.username user.username
json.first_name user.first_name
json.email user.email
# do not show password
json.about user.about
json.age user.age
json.gender user.gender
json.looking_for_gender user.looking_for_gender
json.looking_for_role user.looking_for_role

json.friendly_gender user.friendly_gender
json.friendly_looking_for_gender user.friendly_looking_for_gender
json.friendly_looking_for_role user.friendly_looking_for_role

json.user_hangouts do 
  json.array! user.user_hangouts, partial: "api/user_hangouts/user_hangout", as: :user_hangout
end

json.images do 
  json.array! user.images, partial: "api/images/image", as: :image
end

json.default_image_url user.default_image_url