class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.string :title, default: ""
      t.string :description, default: ""

      t.timestamps
    end

	add_index :collections, :user_id

  end
end
