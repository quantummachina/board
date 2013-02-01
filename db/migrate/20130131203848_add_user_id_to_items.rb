class AddUserIdToItems < ActiveRecord::Migration
  def change
  	add_column :items, :user_id, :integer, default: 0
  end
end
