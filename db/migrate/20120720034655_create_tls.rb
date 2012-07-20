class CreateTls < ActiveRecord::Migration
  def change
    create_table :tls do |t|
	t.integer :section_id
	t.integer :i, default: 0
    	t.string :t, default: ''
      t.timestamps
    end
  end
end
