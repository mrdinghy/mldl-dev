class CreateMediationIssues < ActiveRecord::Migration
  def change
    create_view :mediation_issues
  end
end
