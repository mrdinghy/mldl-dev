class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.date :start_date
      t.date :end_date
      t.integer :post_type
      t.decimal :post_value
      t.date :published_at
      t.boolean :is_featured
      t.timestamps
    end
    Post.create_translation_table! :title => :string, :description => :text
  end
  def down
    drop_table :posts
    Post.drop_translation_table!
    end
end







