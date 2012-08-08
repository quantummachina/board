class RemoveNeedColumnFromCollection < ActiveRecord::Migration
  def up
  	remove_column :collections, :needs
  end

  def down
  end
end
