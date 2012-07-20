class FixLColumnToTls < ActiveRecord::Migration
  def up
  	change_column :tls, :t, :text, default: ''
  end

  def down
  end
end
