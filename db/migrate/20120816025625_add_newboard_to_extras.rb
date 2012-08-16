class AddNewboardToExtras < ActiveRecord::Migration
  def change
  	add_column :extras, :newboard, :boolean, default: false
  end
end
