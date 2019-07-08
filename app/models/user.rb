class User < ApplicationRecord
  has_secure_password

  has_many :images

  has_many :user_hangouts
  has_many :hangouts, through: :user_hangouts
  # has_many :requests

  validates :email, presence: true
  validates :email, uniqueness: true

  enum gender: {prefer_not_to_say: 0, men: 1, women: 2}, _prefix: true
  enum looking_for_gender: {both_men_and_women: 0, men: 1, women: 2}, _prefix: true
  enum looking_for_role: {both_friendship_and_romance: 0, romance: 1, friendship: 2}, _prefix: true

  def friendly_gender
    if gender_prefer_not_to_say?
      return "(Gender not specified)"
    elsif gender_men?
      return "Male"
    elsif gender_women?
     return  "Female"
    end
  end

  def friendly_looking_for_role
    if looking_for_role_both_friendship_and_romance?
      return "friendship or romance"
    elsif looking_for_role_romance?
      return "romance"
    elsif looking_for_role_friendship?
      return "friendship"
    end
  end

  def friendly_looking_for_gender
    if looking_for_gender_both_men_and_women?
      return "any gender identity"
    elsif looking_for_gender_men?
      return "men"
    elsif looking_for_gender_women?
      return "women"
    end
  end

  def search_by_preferences
    my_hangout_ids = self.user_hangouts.pluck(:hangout_id)
    matched_user_ids = UserHangout.where(hangout_id: my_hangout_ids).where("user_id != ?", self.id).pluck(:user_id).uniq

    denied_requests = Request.all.where("requester_id = ? OR requestee_id = ?", self.id, self.id).where(status: 2)
    old_requests = Request.all.where("requester_id = ?", self.id)
    confirmed_requests = Request.all.where("requester_id = ? OR requestee_id = ?", self.id, self.id).where(status: 1)

    denied_ids = denied_requests.pluck(:requestee_id, :requester_id).flatten.uniq
    old_ids = old_requests.pluck(:requestee_id).uniq
    confirmed_ids = confirmed_requests.pluck(:requestee_id, :requester_id).flatten.uniq
    
    ids_to_check = matched_user_ids - denied_ids - old_ids - confirmed_ids

    if ids_to_check.any?
      users = User.where(id: ids_to_check)

      unless User.looking_for_genders[self.looking_for_gender] == 0
        return users.where("gender = ?", User.looking_for_genders[self.looking_for_gender])
      end
      
      users
    else
      User.where(id: nil)
    end
  end

  def confirmed_matches
    confirmed_requests = Request.all.where("requester_id = ? OR requestee_id = ?", self.id, self.id).where(status: 1)

    confirmed_match_ids = confirmed_requests.pluck(:requestee_id, :requester_id).flatten.uniq
    confirmed_match_ids.delete(self.id)

    matches = User.where(id: confirmed_match_ids)
  end

  def date_matched(compared_user)
    request = Request.find_by("requester_id = ? OR requestee_id = ? AND status = ?", self.id, self.id, 1) && 
              Request.find_by("requester_id = ? OR requestee_id = ?", compared_user.id, compared_user.id)
    request.updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def common_hangouts(compared_user)
    my_hangout_ids = self.hangouts.pluck(:id)
    their_hangout_ids = compared_user.hangouts.pluck(:id)

    shared_hangout_ids = my_hangout_ids & their_hangout_ids

    shared_hangouts = Hangout.where(id: shared_hangout_ids)
  end

  def message_thread(recipient_id)
    Message.all.where("sender_id = ? AND recipient_id = ? OR recipient_id = ? AND sender_id = ?", self.id, recipient_id, self.id, recipient_id).order(created_at: :desc)
  end

  def default_image_url
    if images.length > 0
      images.first.default_image_url
    else
      "https://i1.wp.com/crimsonems.org/wp-content/uploads/2017/10/profile-placeholder.gif?fit=250%2C250&ssl=1"
    end
  end
end
