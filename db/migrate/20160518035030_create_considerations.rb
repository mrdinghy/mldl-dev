class CreateConsiderations < ActiveRecord::Migration
  def change
    create_table :considerations do |t|
      t.integer :meeting_id
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
