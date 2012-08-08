class Genvars < ActiveRecord::Migration
  def up
  	create_table :genvars do |t|
    	t.string :name, default: ''
    	t.integer :value, default: 0
      	t.timestamps
  	end
  end

  def down
  end
end
