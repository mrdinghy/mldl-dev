class AddAttachmentImageToSiteImages < ActiveRecord::Migration
  def self.up
    change_table :site_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :site_images, :image
  end
end
