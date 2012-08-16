class AddNewboardToExtras < ActiveRecord::Migration
  def change
  	add_column :extras, :newboard, :booleand, default: false
  end
end
