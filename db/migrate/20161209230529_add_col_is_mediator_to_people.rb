class AddColIsMediatorToPeople < ActiveRecord::Migration
  def change
    add_column :people, :is_mediator, :boolean
  end
end
