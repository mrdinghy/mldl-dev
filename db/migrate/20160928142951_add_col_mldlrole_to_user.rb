class AddColMldlroleToUser < ActiveRecord::Migration
  def change
    add_column :users, :mldlrole, :integer
  end
end
