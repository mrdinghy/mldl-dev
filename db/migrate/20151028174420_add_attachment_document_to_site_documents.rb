class AddAttachmentDocumentToSiteDocuments < ActiveRecord::Migration
  def self.up
    change_table :site_documents do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :site_documents, :document
  end
end
