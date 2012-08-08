class AddColumnsToExtras < ActiveRecord::Migration
  def change
  	add_column :extras, :messages, :integer, default: 0
  	add_column :extras, :requests, :integer, default: 0
  end
end
