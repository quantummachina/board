class Item < ActiveRecord::Base
  attr_accessible :collection_id, :content, :content_html
end
