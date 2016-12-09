class AddColCodeToInfopopups < ActiveRecord::Migration
  def change
    add_column :infopopups, :code, :string
  end
end
