class Attachment < ActiveRecord::Base
  attr_accessible :file, :user_id
  belongs_to :user

  has_attached_file :file,
     :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"

end
