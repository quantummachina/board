class CreateCfollowings < ActiveRecord::Migration
  def change
    create_table :cfollowings do |t|
      t.integer :user_id
      t.integer :cfollowed_id

      t.timestamps
    end
  end
end
