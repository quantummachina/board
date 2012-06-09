class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :provider, :string, default: ""
  	add_column :users, :uid, :integer, default: 0
  	add_index :users, [:uid, :provider]
  end
end
