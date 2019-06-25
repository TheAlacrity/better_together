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


  def search_by_preferences

    my_hangout_ids = self.user_hangouts.pluck(:hangout_id)
    matched_user_ids = UserHangout.where(hangout_id: my_hangout_ids).where("user_id != ?", self.id).pluck(:user_id).uniq
    User.where(id: matched_user_ids).where("gender = ? OR gender = 0", looking_for_gender)
  end

end
