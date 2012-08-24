class Request < ActiveRecord::Base
  attr_accessible :invite, :collection_id, :user_id, :message, :from_id, :vacant_id

  belongs_to :user
  belongs_to :collection

  default_scope order: 'requests.created_at DESC'
end
