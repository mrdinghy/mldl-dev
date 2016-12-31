class AddColRaisedOnToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :raised_on, :date
  end
end
