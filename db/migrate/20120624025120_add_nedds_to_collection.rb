class AddNeddsToCollection < ActiveRecord::Migration
  def change
  	add_column :collections, :needs, :string, default: ""
  end
end
