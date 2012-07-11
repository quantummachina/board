class AddTypeToLinks < ActiveRecord::Migration
  def change
  	add_column :items, :kind, :integer, default: 0
  end
end
