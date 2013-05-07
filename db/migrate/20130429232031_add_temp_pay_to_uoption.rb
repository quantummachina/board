class AddTempPayToUoption < ActiveRecord::Migration
  def change
  	add_column :uoptions, :temp_pay, :int, default: 0
  end
end
