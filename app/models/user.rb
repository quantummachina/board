class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :password_confirmation
	has_secure_password

	has_many :collections, dependent: :destroy
	has_many :items, through: :collections
	has_many :collaborations
	has_many :collaboratives, through: :collaborations, source: :collection

	before_save :create_remember_token

	#validates :name,  presence: true, length: { maximum: 50 }
	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: valid_email_regex }, 
	                  uniqueness: { case_sensitive: false }
	validates :password, length: {minimum: 6}

	
	private

    	def create_remember_token
    		self.remember_token = SecureRandom.urlsafe_base64
    	end

end
