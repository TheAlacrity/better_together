json.array! @users.each do |user|
  json.id user.id
  json.username user.username
  json.first_name user.first_name
  json.email user.email
  json.about user.about
  json.age user.age
  json.gender user.gender
  json.updated_at user.updated_at

  json.images do 
    json.array! user.images, partial: "api/images/image", as: :image
  end

  json.default_image_url user.default_image_url
  
  # list of hangouts in common
  json.common_hangouts user.common_hangouts(current_user)


  json.user_hangouts do 
    json.array! user.user_hangouts, partial: "api/user_hangouts/user_hangout", as: :user_hangout
  end

  # date matched
  json.date_matched user.date_matched(current_user)
end