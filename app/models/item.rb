class Item < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper

  attr_accessible :collection_id, :content, :content_html, :kind

  belongs_to :collection

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
  	link target: "_blank", rel: "nofollow"
  	simple_format
  end

  def set_ch
    self.content_digest = 'fuck yeah!'
    save
  end
  handle_asynchronously :set_ch

  def get_image
    content
  end
  #handle_asynchronously :get_image

  def get_embeeded(size)
    default_og(embeeded(content,size))
  end

private 
  def embeeded(content, size)
    w=69*size + 12*(size-1)
    h=w*0.71
    if content[0..4] == '*$&%#' #attachment
      aid = content[5..(content.length-1)].to_i
      a = Attachment.find(aid)
      link_to a.file.url, target: "_blank", class: "thumbnail" do
            auto_html(a.file.url){ html_escape; image}
      end
    else
      if content.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)

        link_to content[/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i], target: "_blank", class: "thumbnail" do
            auto_html(content){ html_escape; image}
          end
      else
        if content.match(/(https?):\/\/(www.)?be(hance)?\.net\/gallery\/([A-Za-z0-9_-]*)\/([0-9])*/)
          #'behance'
          link_to content, target: 'blank' do
            #auto_html(content){behance_og_t}
            auto_html(content){behance_og_i}
          end
        else
      auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h, wmode: 'transparent'); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format} #google_map(width: w, height: h); google_map(width: w, height: h);
        end
      end
    end  
  end

  def default_og(content)
    ini = content.index('llow">h') # h 'ensures' begins with http
    if !ini.nil?
      nd = content.index('</a>')
      sub = content[(ini+6) .. (nd-1)]

      r = auto_html(sub){default_og_i}
      if r != sub
        link_to sub, target: 'blank' do
          r
        end
      else
        content
      end
    else
      content
    end
  end
end