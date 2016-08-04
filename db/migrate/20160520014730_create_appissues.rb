class CreateAppissues < ActiveRecord::Migration
  def change
    create_table :appissues do |t|
      t.string :uuid
      t.string :yourname
      t.date :originalmeet
      t.integer :issueid
      t.string :meetingname
      t.string :structurecode
      t.string :county
      t.string :district
      t.string :status
      t.string :issuedistrict
      t.string :community
      t.string :category
      t.string :raisedby
      t.string :disputant
      t.integer :duration
      t.text :actioncommittee
      t.text :actiondescription
      t.text :actionnote
      t.string :resolved
      t.date :resolutiondate
      t.text :docslink
      t.string :updatetype
      t.string :resolutiontype
      t.date :updated_on
      t.text :updatedesc
      t.date :mediationdate
      t.string :mediationoutcome
      t.text :issuedesc
      t.string :issuename
      t.text :issuenote
      t.text :statusnote
      t.text :resolution

      t.timestamps null: false
    end
  end
end
