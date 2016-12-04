class AddColumnIsInactiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_inactive, :boolean
  end
end
