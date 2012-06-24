class Line < ActiveRecord::Base
    attr_accessible :conversation_id, :text, :user_id
    belongs_to :conversation
    belongs_to :user

    default_scope order: 'lines.created_at DESC'
end
