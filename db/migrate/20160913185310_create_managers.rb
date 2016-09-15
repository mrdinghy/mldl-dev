class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :userrole_id
      t.integer :structure_id

      t.timestamps null: false
    end
  end
end
