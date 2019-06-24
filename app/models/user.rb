class User < ApplicationRecord
  has_secure_password

  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
  has_many :requests

  validates :email, presence: true
  validates :email, uniqueness: true

  enum gender: {undefined: 0, male: 1, female: 2}, _prefix: true
  enum looking_for_gender: {undefined: 0, male: 1, female: 2}, _prefix: true
  enum looking_for_role: {both: 0, romance: 1, friendship: 2}
end
