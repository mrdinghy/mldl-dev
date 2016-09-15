class CreateDisputants < ActiveRecord::Migration
  def change
    create_table :disputants do |t|
      t.integer :person_id
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
