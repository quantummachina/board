class CreateConversationsAndLines < ActiveRecord::Migration
  def up
  	create_table :conversations do |t|
    	t.integer :user_id
    	t.integer :interlocutor_id

      t.timestamps
    end
	add_index :conversations, :user_id
    add_index :conversations, :interlocutor_id
    add_index :conversations, [:user_id, :interlocutor_id], unique: true

    create_table :lines do |t|
    	t.integer :conversation_id
    	t.integer :user_id
    	t.text :text, default: ""
      t.timestamps
    end
    
  end

  def down
  end
end
