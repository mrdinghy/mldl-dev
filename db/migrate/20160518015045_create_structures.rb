class CreateStructures < ActiveRecord::Migration
  def change
    create_table :structures do |t|
      t.string :name
      t.integer :structuretype
      t.string :short
      t.integer :district_id
      t.integer :county_id
      t.integer :parent_id
      t.integer :project_id
      t.string :default_location
      t.timestamps null: false
    end
  end
end
