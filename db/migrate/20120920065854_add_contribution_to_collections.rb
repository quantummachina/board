class AddContributionToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :contribution, :text, default: ''
  end
end
