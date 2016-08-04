class AddColumnsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :technicalarea_ids, :string
    add_column :searches, :targetgroup_ids, :string
    add_column :searches, :organization_ids, :string
  end
end
