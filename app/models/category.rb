class Category < ApplicationRecord
  belongs_to :hangout

  validates :name, uniqueness: true

  enum name: {unspecified: 0, dining: 1, entertainment: 2, active_or_exercise: 3}
end
