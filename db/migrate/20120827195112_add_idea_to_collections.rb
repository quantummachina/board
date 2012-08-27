class AddIdeaToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :idea, :string, default: ''
  	change_column :collections, :description, :text, default: ''
  end
end
