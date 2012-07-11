class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :collection_id
      t.text :content
      t.text :content_html

      t.timestamps
    end

    add_index :items, :collection_id
  end
end
