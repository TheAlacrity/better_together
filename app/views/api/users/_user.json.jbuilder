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
json.friendly_looking_for_gender user.friendly_looking_for_gender
json.friendly_looking_for_role user.friendly_looking_for_role

json.hangouts do 
  json.array! user.hangouts, partial: "api/hangouts/hangout", as: :hangout
end

json.images do 
  json.array! user.images, partial: "api/images/image", as: :image
end