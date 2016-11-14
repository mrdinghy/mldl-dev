class AddOriginnoteToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :originnote, :text
  end
end
