class AddPromotedToUsers < ActiveRecord::Migration
  def change
  	add_column :collections, :promoted, :boolean, default: false
  end
end
