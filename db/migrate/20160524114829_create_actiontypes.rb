class CreateActiontypes < ActiveRecord::Migration
  def change
    create_table :actiontypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
