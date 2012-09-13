class CreateUoptions < ActiveRecord::Migration
  def change
    create_table :uoptions do |t|
      t.integer :user_id
      t.boolean :n_requests, default: true
      t.boolean :n_messages, default: true
      t.boolean :n_comments, default: true

      t.timestamps
    end
    add_index :uoptions, :user_id, unique: true
  end
end
