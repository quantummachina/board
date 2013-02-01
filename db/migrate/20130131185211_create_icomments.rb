class CreateIcomments < ActiveRecord::Migration
  def change
    create_table :icomments do |t|

    	t.integer :item_id
    	t.integer :user_id
    	t.text :text

      t.timestamps
    end
  end
end
