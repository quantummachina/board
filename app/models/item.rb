class Item < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper

  attr_accessible :collection_id, :content, :content_html, :kind, :urltype, :og_image, :pre_content

  belongs_to :collection, touch: true

  belongs_to :user

  default_scope order: 'items.created_at DESC'

  validates :content, presence: true

  auto_html_for :content do
  	html_escape
  	image
  	vimeo(width: 190, height: 125)
  	youtube(width: 190, height: 125)
  	google_map(width: 190, height: 135)
  	soundcloud(width: 190, height: 135)
  	link target: "blank", rel: "nofollow"
  	simple_format
  end

  def set
    # 1 attachment, 2 image url, 3 url w/og, 4 url/text
    if content[0..4] == '*$&%#' #attachment
      self.urltype = 1
      aid = content[5..(content.length-1)].to_i
      a = Attachment.find(aid)
      self.og_image = auto_html(a.file.url){ html_escape; image}
      self.pre_content = link_to og_image, a.file.url, target: "_blank", class: "thumbnail"

    else
      if content.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)
        self.urltype = 2
        self.og_image = auto_html(content){ html_escape; image}
        self.pre_content = link_to og_image, content[/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i], target: "_blank", class: "thumbnail"
      else
        #particular ogs
        img = auto_html(content){ html_escape; vimeo_og; youtube_og; soundcloud_og; link target: "blank", rel: "nofollow"; simple_format}
        if img.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)
          self.og_image = img
        end
        #else and general og
        size=3
        w=69*size + 12*(size-1)
        h=w*0.71
        self.pre_content=auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h, wmode: 'transparent'); soundcloud(width: w, height: h); link target: "blank", rel: "nofollow"; simple_format}
        set_og(pre_content)
        if og_image == ''
          self.urltype = 4
        else
          self.urltype = 3
        end
      end
    end
    save
  end

  #handle_asynchronously :get_image

private 

  def set_og(content)
    #part 1, rescues ogi pre_content
    ini = content.index('llow">h') # h 'ensures' begins with http
    if !ini.nil?
      nd = content.index('</a>')
      sub = content[(ini+6) .. (nd-1)]

      r = auto_html(sub){default_og_i}
      if r != sub
        self.og_image = r
        self.pre_content = link_to r, sub, target: 'blank', class: "thumbnail"
      end
    end
    #Pt2, rescues vimeo

  end
end