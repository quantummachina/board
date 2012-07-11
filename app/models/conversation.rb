class Conversation < ActiveRecord::Base
    attr_accessible :user_id, :interlocutor_id
    belongs_to :user
    belongs_to :interlocutor, class_name: "User"
    has_many :lines, dependent: :destroy
end
