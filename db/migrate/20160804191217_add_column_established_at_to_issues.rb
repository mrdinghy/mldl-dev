class AddColumnEstablishedAtToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :established_at, :date
  end
end
