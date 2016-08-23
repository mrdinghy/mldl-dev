class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name_first
      t.string :name_last
      t.string :phone
      t.string :title
      t.string :email
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
