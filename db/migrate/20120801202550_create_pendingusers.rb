class CreatePendingusers < ActiveRecord::Migration
  def change
    create_table :pendingusers do |t|
      t.string :email
      t.integer :from
      t.integer :collection

      t.timestamps
    end
  end
end
