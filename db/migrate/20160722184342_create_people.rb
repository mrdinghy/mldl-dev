class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name_first
      t.string :name_last
      t.string :phone
      t.string :title
      t.string :email
      t.integer :organization_id
      t.integer :structure_id
      t.integer :gender
      t.string :community
      t.string :agencyname
      t.string :salut
      t.string :suffix

      t.timestamps null: false
    end
  end
end
