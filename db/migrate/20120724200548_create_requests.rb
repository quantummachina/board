class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :from_id
      t.integer :collection_id
      t.integer :vacant_id
      t.string :message
      t.boolean :invite

      t.timestamps
    end
  end
end
