class CreateTableStates < ActiveRecord::Migration
  def up
  	create_table :states do |t|
      t.string  :name
    end
    create_table :cities do |t|
      t.integer :state_id
      t.string  :name
    end
  end

  def down
  end
end
