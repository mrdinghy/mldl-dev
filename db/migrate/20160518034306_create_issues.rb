class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.text :description
      t.integer :structure_id
      t.integer :district_id
      t.string :location
      t.integer :manager_id
      t.integer :scope_id
      t.text :status_note
      t.text :actionplan
      t.date :resolution_date
      t.string :disputant
      t.string :community
      t.integer :category_id
      t.string :old_id
      t.integer :raised_by
      t.text :resolution
      t.text :actioncommittee
      t.date :cancelled_at


      t.timestamps null: false
    end
  end
end
