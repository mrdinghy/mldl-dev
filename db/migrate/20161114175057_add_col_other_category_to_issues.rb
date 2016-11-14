class AddColOtherCategoryToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :other_category, :string
  end
end
