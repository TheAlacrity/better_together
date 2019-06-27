json.array! @users.each do |user|
  json.id user.id
  json.username user.username
  json.first_name user.first_name
  json.email user.email
  json.about user.about
  json.age user.age
  json.gender user.gender
  json.updated_at user.updated_at
  # json.friendly_updated_at user.friendly_updated_at
  
  # list of hangouts in common
  json.common_hangouts user.common_hangouts(current_user)
end