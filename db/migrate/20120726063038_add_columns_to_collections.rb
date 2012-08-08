class AddColumnsToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :status, :boolean, default: false
  	add_column :collections, :cover, :integer, default: 0

  end
end
