class User < ActiveRecord::Base
    #UID + PROVIDER USELESS. Using Session variables
	attr_accessible :email, :name, :password, :password_confirmation, :admin, :uid, :provider, :city, :category_id, :subcategory_id, :link_a, :link_b, :link_c, :link_d, :about
	has_secure_password

	has_many :collections, dependent: :destroy
	has_many :items, through: :collections
	has_many :collaborations, dependent: :destroy
	has_many :collaboratives, through: :collaborations, source: :collection
    has_many :attachments #add destroy after well destroyed is implemented
    has_many :conversations
    has_many :reverse_conversations, foreign_key: "interlocutor_id", class_name: "Conversation"
    has_many :interlocutors, through: :reverse_conversations, source: :interlocutor

    belongs_to :category
    belongs_to :subcategory, foreign_key: 'subcategory_id', class_name: 'Category'

	before_save :create_remember_token

	#validates :name,  presence: true, length: { maximum: 50 }
	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: valid_email_regex }, 
	                  uniqueness: { case_sensitive: false }
	validates :password, length: {minimum: 6}

	devise :omniauthable

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
  		end
    end
  user
end

	private

    	def create_remember_token
    		self.remember_token = SecureRandom.urlsafe_base64
    	end


end
