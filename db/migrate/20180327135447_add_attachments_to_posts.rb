class AddAttachmentsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :attachments, :string
  end
end
