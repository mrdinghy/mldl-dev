class CreateAppissues < ActiveRecord::Migration
  def change
    create_table :appissues do |t|
      t.date :originaltimestamp
      t.string :uuid
      t.string :yourname
      t.date :originalmeetingdate
      t.string  :meetingcode
      t.integer :issueid
      t.string :meetingname
      t.string :structure
      t.string :structurecounty
      t.string :structuredistrict
      t.string :status
      t.string :issuedistrict
      t.string :community
      t.string :category
      t.string :raisedby
      t.string :disputant
      t.integer :duration
      t.text :actionplancommittee
      t.text :actionplandescription
      t.text :actionplannotes
      t.string :ongoing_resolved
      t.string :resolutiondate
      t.date :resolutiondate
      t.string :report_ongoing
      t.text :googledocs
      t.text :resolution
      t.string :updatetype
      t.string :resolutiontype
      t.date :updatedate
      t.text :updatedescription
      t.date :mediationdate
      t.string :mediationoutcome
      t.text :issuedescription
      t.string :issuename
      t.text :issuenotes
      t.text :statusnotes
      t.date :referraldate
      t.string :referredto
      t.text :referralnote

      t.timestamps null: false
    end
  end
end
