class AddConclusionToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :conclusion, :text, default: ''
  	remove_column :collections, :status
  	add_column :collections, :status, :integer, default: 0
  end
end
