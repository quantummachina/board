class AddPromoteToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :quarantine, :boolean, default: false
  end
end
