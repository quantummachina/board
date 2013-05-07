class AddGoalAndEndDateToCollections < ActiveRecord::Migration
  def change
  	add_column :collections, :goal, :text, default: ''
  	add_column :collections, :end_date, :date, default: Time.now
  end
end
