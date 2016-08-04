class AddColumnLaststructureIdToIssueactions < ActiveRecord::Migration
  def change
    add_column :issueactions, :laststructure_id, :integer
  end
end
