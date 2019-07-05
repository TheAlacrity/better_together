class UserHangout < ApplicationRecord
  belongs_to :user
  belongs_to :hangout

  validates :user_id, uniqueness: {scope: :hangout_id}
end
