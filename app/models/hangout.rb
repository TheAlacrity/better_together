class Hangout < ApplicationRecord
  has_many :user_hangouts
  has_many :users, through: :user_hangouts

  belongs_to :category

  validates :name, presence: true

end
