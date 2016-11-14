class CreatePieCategories < ActiveRecord::Migration
  def change
    create_view :pie_categories
  end
end
