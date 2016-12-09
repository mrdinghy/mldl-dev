class CreateCommitteemembers < ActiveRecord::Migration
  def change
    create_table :committeemembers do |t|
      t.integer :membership_id
      t.integer :issue_id

      t.timestamps null: false
    end
  end
end
