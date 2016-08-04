class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :person_id
      t.integer :structure_id

      t.timestamps null: false
    end
  end
end
