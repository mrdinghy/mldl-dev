class CreateCategoriesStructures < ActiveRecord::Migration
  def change
    create_view :categories_structures
  end
end
