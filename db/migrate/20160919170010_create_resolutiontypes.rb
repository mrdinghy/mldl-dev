class CreateResolutiontypes < ActiveRecord::Migration
  def change
    create_table :resolutiontypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
