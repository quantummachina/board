class AddColumnCategoryToUsers < ActiveRecord::Migration
  def change
  	add_column :collections, :category_id, :integer, default: 1
  end
end
