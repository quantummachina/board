class DropCommenters < ActiveRecord::Migration
  def up
  	drop_table :commenters
  	remove_column :uoptions, :n_commenters
  end

  def down
  end
end
