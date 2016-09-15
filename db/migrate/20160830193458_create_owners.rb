class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :issue_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
