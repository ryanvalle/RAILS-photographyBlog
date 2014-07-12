class AddAttachmentToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :attachment, :text
  end
end
