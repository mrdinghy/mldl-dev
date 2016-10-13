class AddColMediateEndToMediations < ActiveRecord::Migration
  def change
    add_column :mediations, :mediate_end, :date
    add_column :mediations, :mediate_start, :date
  end
end
