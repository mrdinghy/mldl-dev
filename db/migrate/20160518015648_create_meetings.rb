class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :meeting_on
      t.time :starts_at
      t.string :name
      t.string :location
      t.integer :structure_id
      t.integer :attendees_male
      t.integer :attendees_females
      t.boolean :meeting_held
      t.string :old_id
      t.integer :duration

      t.timestamps null: false
    end
  end
end
