class AddRewardAndPayToVacants < ActiveRecord::Migration
  def change
  	add_column :vacants, :reward, :text, default: ''
  	add_column :vacants, :pay, :integer, default: 0
  end
end
