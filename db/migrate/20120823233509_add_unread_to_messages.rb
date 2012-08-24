class AddUnreadToMessages < ActiveRecord::Migration
  def change
  	add_column :conversations, :unread, :integer, default: 0
  end
end
