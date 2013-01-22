class User < ActiveRecord::Base
    #UID + PROVIDER USELESS. Using Session variables
	attr_accessible :email, :name, :password, :password_confirmation, :admin, :uid, :provider, :city, :category_id, :subcategory_id, :c_art, :c_video, :c_music, :c_tecnology, :c_design, :link_a, :link_b, :link_c, :link_d, :about, :notifications, :city_id, :photo
	has_secure_password

  has_attached_file :photo,
     :storage => :s3,
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename",
     styles: {thumb: "64x64#"}

	has_many :collections, dependent: :destroy
	has_many :items, through: :collections
	has_many :collaborations, dependent: :destroy
	has_many :collaboratives, through: :collaborations, source: :collection
    has_many :attachments #add destroy after well destroyed is implemented
    has_many :conversations
    has_many :reverse_conversations, foreign_key: "interlocutor_id", class_name: "Conversation"
    has_many :interlocutors, through: :reverse_conversations, source: :interlocutor
    has_many :requests
    has_many :notifications
    has_many :comments
    has_many :ufollowings, dependent: :destroy
    #has_many :ufolloweds, through: :ufollowings,source: :ufollowed
    has_many :cfollowings, dependent: :destroy

    has_one :extra
    has_one :uoption

    #belongs_to :category / ya no requiere
    #belongs_to :subcategory, foreign_key: 'subcategory_id', class_name: 'Category'
    belongs_to :city

	before_save :create_remember_token

	#validates :name,  presence: true, length: { maximum: 50 }
	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: valid_email_regex }, 
	                  uniqueness: { case_sensitive: false }
	validates :password, length: {minimum: 6}, on: :create
    validates :password, length: {minimum: 6}, on: :update, unless: lambda{|user| user.password.blank?}

	devise :omniauthable
    default_scope order: 'users.updated_at DESC'

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
    	user = User.find_by_email(auth.info.email)
    	if user
    		user.update_attributes(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid: auth.uid)
    	else
            user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid: auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
            Extra.create(user_id: user.id)
            Uoption.create(user_id: user.id)
            AppMailer.welcome_email(user).deliver
  		end
    end
  user
end

	private

    	def create_remember_token
    		self.remember_token = SecureRandom.urlsafe_base64
    	end


end
