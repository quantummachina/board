class ChangeRequestMessageToText < ActiveRecord::Migration
  def up
  	change_column :requests, :message, :text, default: ""
  end

  def down
  end
end
