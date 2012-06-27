class AddTypeToLinks < ActiveRecord::Migration
  def change
  	add_column :items, :kind, :string, default: 0
  end
end
