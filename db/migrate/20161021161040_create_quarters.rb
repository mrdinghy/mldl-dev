class CreateQuarters < ActiveRecord::Migration
  def change
    create_table :quarters do |t|
      t.integer :qtryear
      t.integer :qtrqtr
      t.integer :qtrmonth
      t.timestamps null: false
    end
  end
end
