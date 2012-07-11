class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :about, :string, default: ""
  	add_column :users, :city, :string, default: ""
  	add_column :users, :category_id, :int, default: 2
  	add_column :users, :subcategory_id, :int, default: 2
  	add_column :users, :link_a, :string, default: ""
  	add_column :users, :link_b, :string, default: ""
  	add_column :users, :link_c, :string, default: ""
  	add_column :users, :link_d, :string, default: ""
  end
end
