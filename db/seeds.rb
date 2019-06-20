User.delete_all

user = User.new(
                username: "GeraltOfRivia",
                email: "geralt@gmail.com",
                password: "password",
                password_confirmation: "password",
                about: "The Butcher of Blaviken.",
                age: "134",
                gender: "male",
                looking_for_gender: "female",
                looking_for_role: "romance"
               )
user.save