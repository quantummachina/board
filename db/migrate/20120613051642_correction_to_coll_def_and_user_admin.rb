class CorrectionToCollDefAndUserAdmin < ActiveRecord::Migration
  def up
  	change_column :collections, :category_id, :integer, default: 2
  	add_column :users, :admin, :boolean, default: false
  end

  def down
  end
end
