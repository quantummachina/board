class Item < ActiveRecord::Base
  attr_accessible :collection_id, :content, :content_html

  belongs_to :collection

  belongs_to :user

  default_scope order: 'items.created_at DESC'

  auto_html_for :content do
  	html_escape
  	image
  	vimeo(width: 190, height: 125)
  	youtube(width: 190, height: 125)
  	google_map(width: 190, height: 135)
  	soundcloud(width: 190, height: 135)
  	link target: "_blank", rel: "nofollow"
  	simple_format
  end
end
