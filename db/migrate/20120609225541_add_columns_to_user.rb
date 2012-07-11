class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :provider, :string, default: ""
  	add_column :users, :uid, :string, default: ""
  	add_index :users, :uid
  end
end
