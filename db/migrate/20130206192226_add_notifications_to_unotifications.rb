class AddNotificationsToUnotifications < ActiveRecord::Migration
  def change
  	add_column :uoptions, :n_cfollowers, :boolean, default: :true
  	add_column :uoptions, :n_ufollowers, :boolean, default: :true
  	add_column :uoptions, :n_cfollowings, :boolean, default: :true
  	add_column :uoptions, :n_ufollowings, :boolean, default: :true
  	add_column :uoptions, :n_items, :boolean, default: :true
  end
end
