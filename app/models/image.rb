class Image < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :file
  belongs_to :user

  def default_image_url
    if self.file.attachment
      "http://localhost:3000" + rails_blob_path(self.file, only_path: true) 
    elsif image_url != nil || image_url != ""
      image_url
    else
      "https://i1.wp.com/crimsonems.org/wp-content/uploads/2017/10/profile-placeholder.gif?fit=250%2C250&ssl=1"
    end
  end
end
