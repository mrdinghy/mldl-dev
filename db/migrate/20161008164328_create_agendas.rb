class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.integer :meeting_id
      t.integer :issue_id
      t.text :agenda_note
      t.integer :result
      t.boolean :addressed


      t.timestamps null: false
    end
  end
end
