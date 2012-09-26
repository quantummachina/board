class AddCityIdToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :city_id, :integer, default: 0
  end
end
