class AddProfitableToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :profitable, :boolean, default: false
  end
end
