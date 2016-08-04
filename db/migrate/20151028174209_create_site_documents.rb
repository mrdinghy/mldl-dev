class CreateSiteDocuments < ActiveRecord::Migration
  def up
    create_table :site_documents do |t|
      t.string :documentable_type
      t.integer :documentable_id
      t.integer :nid
      t.timestamps null: false
    end
    SiteDocument.create_translation_table! :name => :string
  end
  def down
    drop_table :site_documents
    SiteDocument.drop_translation_table!
   end
 end
