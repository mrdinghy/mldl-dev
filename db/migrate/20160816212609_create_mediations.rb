class CreateMediations < ActiveRecord::Migration
  def change
    create_table :mediations do |t|
      t.string :name
      t.integer :issue_id
      t.datetime :mediation_start
      t.datetime :mediation_end
      t.text :mediation_notes

      t.timestamps null: false
    end
  end
end
