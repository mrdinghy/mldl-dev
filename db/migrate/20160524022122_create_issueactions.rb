class CreateIssueactions < ActiveRecord::Migration
  def change
    create_table :issueactions do |t|
      t.integer :actiontype
      t.integer :meeting_id
      t.integer :mediation_id
      t.integer :organization_id
      t.integer :issue_id
      t.text :actionbody
      t.integer :user_id
      t.integer :structure_id
      t.datetime :old_resolution_date
      t.integer :laststructure_id


      t.timestamps null: false
    end
  end
end
