class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.date :published_at
      t.boolean :is_featured
      t.timestamps
    end
  end
end







