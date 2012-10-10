class AddCommentersToEtras < ActiveRecord::Migration
  def change
  	add_column :uoptions, :n_commenters, :boolean, default: true
  end
end
