class ChangeUidInUsers < ActiveRecord::Migration
  def up
  	change_column :users, :uid, :long, default: 0
  end

  def down
  end
end
