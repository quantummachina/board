class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :collection_id
      t.integer :user_id

      t.timestamps
    end

    add_index :collaborations, :collection_id
    add_index :collaborations, :user_id
    add_index :collaborations, [:user_id, :collection_id], unique: :true
  end
end
