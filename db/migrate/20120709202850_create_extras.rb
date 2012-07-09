class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.integer :user_id
      t.integer :notifications, default: 0

      t.timestamps
    end

    add_index :extras, :user_id, unique: true
  end
end
