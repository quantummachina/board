class AddColmnsToItems < ActiveRecord::Migration
  def change
  	add_column :items, :urltype, :integer, default: 0
  	add_column :items, :og_image, :string, default: ''
  	add_column :items, :pre_content, :text, default: ''
  end
end
