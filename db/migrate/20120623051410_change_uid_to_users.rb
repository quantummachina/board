class ChangeUidToUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :uid
  	add_column :users, :uid, :integer, default: 0
  end

  def down
  end
end
