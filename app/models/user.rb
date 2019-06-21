class User < ApplicationRecord
  has_secure_password

  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
  has_many :requests

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password_confirmation, presence: true

  enum gender: {undefined: 0, male: 1, female: 2, prefer_not_to_say: 3}
  enum looking_for_gender: {any: 0, prefer_male: 1, prefer_female: 2}
  enum looking_for_role: {both: 0, romance: 1, friendship: 2}
end
