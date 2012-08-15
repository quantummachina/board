class CreateExternallinks < ActiveRecord::Migration
  def change
    create_table :externallinks do |t|
    	t.integer :collection_id
    	t.text :link

      t.timestamps
    end
  end
end
