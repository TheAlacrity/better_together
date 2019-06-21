User.delete_all
Hangout.delete_all
Category.delete_all
UserHangout.delete_all

geralt = User.create(
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
yen = User.create(
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
ciri = User.create(
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

unspecified_category = Category.create(
                                       name: 0
                                       )
dining = Category.create(
                         name: "dining"
                         )
entertainment = Category.create(
                                name: "entertainment"
                                )
active_or_exercise = Category.create(
                           name: "exercise"
                           )

hangout_1 = Hangout.create(
                         name: "Prairie Moon",
                         address: "4407, 1635 Chicago Ave, Evanston, IL ",
                         category_id: dining.id
                         )
hangout_2 = Hangout.create(
                         name: "Lucky Platter",
                         address: "514 Main St, Evanston, IL",
                         category_id: dining.id
                         )
hangout_3 = Hangout.create(
                         name: "Oak Street Beach",
                         address: "1000 N. Lake Shore Drive, Chicago, IL",
                         category_id: active_or_exercise.id
                         )
hangout_4 = Hangout.create(
                         name: "Century 12 Cinema",
                         address: "1715 Maple Ave, Evanston, IL",
                         category_id: entertainment.id
                         )

user_hangout = UserHangout.create(
                                  user_id: geralt.id
                                  hangout_id: hangout_3.id
                                  )
user_hangout = UserHangout.create(
                                  user_id: yen.id
                                  hangout_id: hangout_3.id
                                  )
user_hangout = UserHangout.create(
                                  user_id: ciri.id
                                  hangout_id: hangout_3.id
                                  )
user_hangout = UserHangout.create(
                                  user_id: ciri.id
                                  hangout_id: hangout_2.id
                                  )
user_hangout = UserHangout.create(
                                  user_id: yen.id
                                  hangout_id: hangout_2.id
                                  )
