class CreateVacants < ActiveRecord::Migration
  def change
    create_table :vacants do |t|
    	t.integer :collection_id
    	t.string :title, default: ''
    	t.string :description, default: ''
      t.timestamps
    end
  end
end
