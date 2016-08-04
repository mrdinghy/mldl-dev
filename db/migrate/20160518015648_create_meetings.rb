class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :meeting_on
      t.time :meeting_start
      t.time :meeting_end
      t.datetime :real_start
      t.datetime :real_end
      t.string :name
      t.string :location
      t.integer :structure_id
      t.integer :attendees_male
      t.integer :attendees_females
      t.boolean :meeting_held

      t.timestamps null: false
    end
  end
end
