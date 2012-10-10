class Commenters < ActiveRecord::Migration
  def up
  	create_table :commenters do |t|
      t.integer  :collection_id
      t.integer :user_id
    end
  end

  def down
  end
end
