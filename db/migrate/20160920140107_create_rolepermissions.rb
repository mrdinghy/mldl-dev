class CreateRolepermissions < ActiveRecord::Migration
  def change
    create_table :rolepermissions do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps null: false
    end
  end
end
