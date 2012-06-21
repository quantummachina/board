class FileAddsToAttachments < ActiveRecord::Migration
  def up
  	add_column :attachments, :file_file_name, :string
  	add_column :attachments, :file_content_type, :string
  	add_column :attachments, :file_file_size, :integer
  	add_column :attachments, :file_updated_at, :datetime
  end

  def down
  end
end
