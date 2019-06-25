class User < ApplicationRecord
  has_secure_password

  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
  has_many :requests

  validates :email, presence: true
  validates :email, uniqueness: true

  enum gender: {prefer_not_say: 0, men: 1, women: 2}, _prefix: true
  enum looking_for_gender: {both_men_and_women: 0, men: 1, women: 2}, _prefix: true
  enum looking_for_role: {both_friendship_and_romance: 0, romance: 1, friendship: 2}

  def friendly_gender
    gender.gsub("_", " ")
  end

  def friendly_looking_for_role
    looking_for_role.gsub("_", " ")
  end

  def friendly_looking_for_gender
    looking_for_gender.gsub("_", " ")
  end

  def search_by_preferences
    my_hangout_ids = self.user_hangouts.pluck(:hangout_id)
    matched_user_ids = UserHangout.where(hangout_id: my_hangout_ids).where("user_id != ?", self.id).pluck(:user_id).uniq

    denied_requests = Request.all.where("requester_id = ? OR requestee_id = ?", self.id, self.id).where(status: 2)
    denied_ids = denied_requests.pluck(:requestee_id, :requester_id).flatten.uniq
    
    ids_to_check = matched_user_ids - denied_ids

    if ids_to_check.any?
      User.where(id: ids_to_check).where("gender = ? OR gender = 0", looking_for_gender.to_i)
    else
      []
    end
  end


end
