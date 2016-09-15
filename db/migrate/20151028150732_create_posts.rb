class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :start_date
      t.date :end_date
      t.integer :post_type
      t.decimal :post_value
      t.date :published_at
      t.boolean :is_featured
      t.timestamps
    end
  end
end







