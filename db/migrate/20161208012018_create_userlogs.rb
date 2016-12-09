class CreateUserlogs < ActiveRecord::Migration
  def change
    create_table :userlogs do |t|
      t.integer :user_id
      t.string :action
      t.string :loggable_type
      t.integer :loggable_id
      t.datetime :logdate

      t.timestamps null: false
    end
  end
end
