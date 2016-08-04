class CreateSiteImages < ActiveRecord::Migration
  def change
    create_table :site_images do |t|
      t.string :name
      t.string :imageable_type
      t.integer :imageable_id
      t.boolean :is_logo

      t.timestamps null: false
    end
  end
end
