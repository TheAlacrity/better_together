User.delete_all
Hangout.delete_all
Category.delete_all
UserHangout.delete_all

geralt = User.new(
                username: "Geralt of Rivia",
                first_name: "Geralt",
                email: "geralt@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "The Butcher of Blaviken.",
                age: "134",
                gender: "male",
                looking_for_gender: "prefer_female",
                looking_for_role: "romance"
               )
geralt.save

yen = User.new(
                username: "Yennefer of Vengerberg",
                first_name: "Yen",
                email: "yen@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "Smells of Lilac and Gooseberries",
                age: "130",
                gender: "female",
                looking_for_gender: 0,
                looking_for_role: 0
               )
yen.save

ciri = User.new(
                username: "Cirilla Fiona Ellen Riannon",
                first_name: "Ciri",
                email: "ciri@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "The Lady of Space and Time",
                age: "21",
                gender: "female",
                looking_for_gender: 0,
                looking_for_role: "friendship"
               )
ciri.save

unspecified_category = Category.new(
                                   name: 0
                                   )
unspecified_category.save

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



user_hangout = UserHangout.new(
                              user_id: geralt.id,
                              hangout_id: hangout_3.id
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

request = Request.new(                   
                     requester_id: ciri.id,
                     requestee_id: yen.id,
                     status: 0
                     )
request.save

