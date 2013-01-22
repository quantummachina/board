class CreateUfollowings < ActiveRecord::Migration
  def change
    create_table :ufollowings do |t|
      t.integer :user_id
      t.integer :ufollowed_id

      t.timestamps
    end

  end
end
