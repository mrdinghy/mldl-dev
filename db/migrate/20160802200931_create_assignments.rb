class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :userrole_id
      t.integer :structure_id

      t.timestamps null: false
    end
  end
end
