class CreateOrganizationtypes < ActiveRecord::Migration
  def change
    create_table :organizationtypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
