class CreateMediators < ActiveRecord::Migration
  def change
    create_table :mediators do |t|
      t.integer :person_id
      t.integer :mediation_id

      t.timestamps null: false
    end
  end
end
