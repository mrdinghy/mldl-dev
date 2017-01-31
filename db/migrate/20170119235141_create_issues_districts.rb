class CreateIssuesDistricts < ActiveRecord::Migration
  def change
    create_table :issues_districts do |t|
      t.integer :issue_id
      t.integer :district_id

      t.timestamps null: false
    end
  end
end
