class AddStatustextToCollection < ActiveRecord::Migration
  def change
  	add_column :collections, :statustext, :text, default: ''
  end
end
