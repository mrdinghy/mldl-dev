class CreateInfopopups < ActiveRecord::Migration
  def change
    create_table :infopopups do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
