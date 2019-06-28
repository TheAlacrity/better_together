User.delete_all
Hangout.delete_all
Category.delete_all
UserHangout.delete_all

puts "started users"

geralt = User.new(
                username: "Geralt of Rivia",
                first_name: "Geralt",
                email: "geralt@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "The Butcher of Blaviken.",
                age: 134,
                gender: 1,
                looking_for_gender: 2,
                looking_for_role: 1
               )
geralt.save

yen = User.new(
                username: "Yennefer of Vengerberg",
                first_name: "Yen",
                email: "yen@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "Smells of Lilac and Gooseberries",
                age: 130,
                gender: 2,
                looking_for_gender: 0,
                looking_for_role: 1
               )
yen.save

ciri = User.new(
                username: "Cirilla Fiona Ellen Riannon",
                first_name: "Ciri",
                email: "ciri@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "The Lady of Space and Time",
                age: 21,
                gender: 2,
                looking_for_gender: 0,
                looking_for_role: 0
               )
ciri.save

jeff = User.new(
                username: "Alacrity",
                first_name: "Jeff",
                email: "jeff@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "The Alacrity",
                age: 33,
                gender: 1,
                looking_for_gender: 2,
                looking_for_role: 0
               )
jeff.save

sessions = User.new(
                username: "Sessions",
                first_name: "Jeff",
                email: "sessions@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "Jefferson Beauregard Sessions",
                age: 70,
                gender: 1,
                looking_for_gender: 2,
                looking_for_role: 1
               )
sessions.save

40.times do # Create fake male users
  name = Faker::Name.unique.male_first_name
  email_name = name.downcase
  about_me = Faker::Hacker.say_something_smart

  user = User.new(
                  username: "#{name}",
                  first_name: "#{name}",
                  email: "#{email_name}@gmail.com",
                  password: "password",
                  password_confirmation: "password",
                  about: "#{about_me}",
                  age: rand(18..40),
                  gender: 1,
                  looking_for_gender: rand(0..2),
                  looking_for_role: rand(0..2)
                  )
  user.save
  puts "user num: #{user.id}"
end

40.times do # Create fake female users
  name = Faker::Name.unique.female_first_name
  about_me = Faker::Hacker.say_something_smart

  user = User.new(
                  username: "#{name}",
                  first_name: "#{name}",
                  email: "#{email_name}@gmail.com",
                  password: "password",
                  password_confirmation: "password",
                  about: "#{about_me}",
                  age: rand(18..40),
                  gender: 2,
                  looking_for_gender: rand(0..2),
                  looking_for_role: rand(0..2)
                  )
  user.save
  puts "user num: #{user.id}"
end

10.times do # Create prefer_not_to_say users
  name = Faker::Name.unique.first_name
  about_me = Faker::Hacker.say_something_smart

  user = User.new(
                  username: "#{name}",
                  first_name: "#{name}",
                  email: "#{email_name}@gmail.com",
                  password: "password",
                  password_confirmation: "password",
                  about: "#{about_me}",
                  age: rand(18..40),
                  gender: 0,
                  looking_for_gender: rand(0..2),
                  looking_for_role: rand(0..2)
                  )
  user.save
  puts "user num: #{user.id}"
end

puts "Users done, starting categories"


undefined_category = Category.new(
                                   name: 0
                                   )
undefined_category.save

dining = Category.new(
                     name: "dining"
                     )
dining.save

entertainment = Category.new(
                            name: "entertainment"
                            )
entertainment.save

active_or_exercise = Category.new(
                                 name: "active_or_exercise"
                                 )
active_or_exercise.save


puts "categories done, starting hangouts"

hangout_1 = Hangout.new(
                       name: "Prairie Moon",
                       address: "4407, 1635 Chicago Ave, Evanston, IL ",
                       category_id: dining.id
                       )
hangout_1.save

hangout_2 = Hangout.new(
                       name: "Lucky Platter",
                       address: "514 Main St, Evanston, IL",
                       category_id: dining.id
                       )
hangout_2.save

hangout_3 = Hangout.new(
                       name: "Oak Street Beach",
                       address: "1000 N. Lake Shore Drive, Chicago, IL",
                       category_id: active_or_exercise.id
                       )
hangout_3.save

hangout_4 = Hangout.new(
                       name: "Century 12 Cinema",
                       address: "1715 Maple Ave, Evanston, IL",
                       category_id: entertainment.id
                       )
hangout_4.save

hangout_5 = Hangout.new(
                       name: "Budweiser Stadium",
                       address: "1 Stadium Drive, Chicago, IL",
                       category_id: entertainment.id
                       )
hangout_5.save

puts "hangouts done, starting user_hangout connections"


user_hangout = UserHangout.new(
                              user_id: geralt.id,
                              hangout_id: hangout_3.id
                              )
user_hangout.save

user_hangout = UserHangout.new(
                              user_id: geralt.id,
                              hangout_id: hangout_5.id
                              )
user_hangout.save

user_hangout = UserHangout.new(
                              user_id: yen.id,
                              hangout_id: hangout_5.id
                              )
user_hangout.save

user_hangout = UserHangout.new(
                              user_id: yen.id,
                              hangout_id: hangout_3.id
                              )
user_hangout.save

user_hangout = UserHangout.new(
                              user_id: ciri.id,
                              hangout_id: hangout_3.id
                              )
user_hangout.save

user_hangout = UserHangout.new(
                              user_id: ciri.id,
                              hangout_id: hangout_2.id
                              )
user_hangout.save

user_hangout = UserHangout.new(
                              user_id: yen.id,
                              hangout_id: hangout_2.id
                              )
user_hangout.save

hangouts_ids = Hangout.pluck(:id)
user_ids = User.pluck(:id)


200.times do
  user_hangout = UserHangout.new(
                  user_id: user_ids.sample,
                  hangout_id: hangouts_ids.sample
                  )
  user_hangout.save # create random user hangout relationships
  puts "user_hangout num: #{user_hangout.id}"
end

puts "user_hangout connections done, requests starting"


# request = Request.new(                   
#                      requester_id: ciri.id,
#                      requestee_id: yen.id,
#                      status: 0
#                      )
# request.save

# request = Request.new(                   
#                      requester_id: jeff.id,
#                      requestee_id: ciri.id,
#                      status: 0
#                      )
# request.save

# request = Request.new(                   
#                      requester_id: ciri.id,
#                      requestee_id: jeff.id,
#                      status: 0
#                      )
# request.save

# request = Request.new(                   
#                      requester_id: sessions.id,
#                      requestee_id: ciri.id,
#                      status: 0
#                      )
# request.save

# request = Request.new(                   
#                      requester_id: ciri.id,
#                      requestee_id: sessions.id,
#                      status: 2
#                      )
# request.save

users = User.all

20.times do
  id_send = rand(6..users.length)
  id_receive = rand(1..5)
  Request.create(
                 requester_id: id_send,
                 requestee_id: id_receive
                 )
end

puts "all done"