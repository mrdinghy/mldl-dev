class CreateMediations < ActiveRecord::Migration
  def change
    create_table :mediations do |t|
      t.string :name
      t.integer :issue_id
      t.date :mediate_start
      t.date :mediate_end
      t.text :mediation_notes
      t.integer :result
      t.boolean :mediation_held

      t.timestamps null: false
    end
  end
end
