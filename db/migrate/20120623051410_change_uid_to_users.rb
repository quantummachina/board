class ChangeUidToUsers < ActiveRecord::Migration
  def up
  	change_column :users, :uid, :integer, default: 0
  end

  def down
  end
end
