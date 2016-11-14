class CreateDistrictsStructures < ActiveRecord::Migration
  def change
    create_view :districts_structures
  end
end
