class AddStoryAndDateToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :story, :text, default: ''
  end
end
