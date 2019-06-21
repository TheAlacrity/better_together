class Hangout < ApplicationRecord
  has_many :user_hangouts
  has_many :users, through: :user_hangouts

  has_many :categories

  validates :name, presence: true

end
