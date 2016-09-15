class CreateSiteDocuments < ActiveRecord::Migration
  def change
    create_table :site_documents do |t|
      t.string :documentable_type
      t.integer :documentable_id
      t.integer :nid
      t.timestamps null: false
    end

   end
 end
