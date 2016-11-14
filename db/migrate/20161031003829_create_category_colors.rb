class CreateCategoryColors < ActiveRecord::Migration
  def change
    create_table :category_colors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
