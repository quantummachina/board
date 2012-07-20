class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :name, default: ''
      t.timestamps
      t.timestamps
    end
  end
end
