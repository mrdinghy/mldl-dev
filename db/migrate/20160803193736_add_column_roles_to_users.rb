class AddColumnRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :structure_admin, :boolean
    add_column :users, :structure_manager, :boolean
    add_column :users, :system_admin, :boolean
    add_column :users, :system_manager, :boolean
  end
end
