class CreateSprojects < ActiveRecord::Migration
  def change
    create_table :sprojects do |t|
      t.integer :collection_id
      t.text :text, default: ''

      t.timestamps
    end
  end
end
