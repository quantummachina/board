class AddColumnCityIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :city_id, :integer, default: 0
  end
end
