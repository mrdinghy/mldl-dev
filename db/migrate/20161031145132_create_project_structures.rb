class CreateProjectStructures < ActiveRecord::Migration
  def change
    create_view :project_structures
  end
end
