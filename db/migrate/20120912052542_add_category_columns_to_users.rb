class AddCategoryColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :c_art, :boolean, default: false;
  	add_column :users, :c_video, :boolean, default: false;
  	add_column :users, :c_music, :boolean, default: false;
  	add_column :users, :c_tecnology, :boolean, default: false;
  	add_column :users, :c_design, :boolean, default: false;
  end
end
