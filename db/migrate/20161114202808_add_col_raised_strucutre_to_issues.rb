class AddColRaisedStrucutreToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :raisedby_structure, :string
  end
end
