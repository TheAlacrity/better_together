json.array! @users.each do |user|
  json.id user.id
  json.username user.username
  json.first_name user.first_name
  json.email user.email
  json.about user.about
  json.age user.age
  json.gender user.gender

  # list of hangouts in common
  # json.common_hangouts user.common_hangouts(current_user)
end