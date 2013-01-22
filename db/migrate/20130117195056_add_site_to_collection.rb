class AddSiteToCollection < ActiveRecord::Migration
  def change
  	add_column :collections, :site, :text, default: ''
  end
end
