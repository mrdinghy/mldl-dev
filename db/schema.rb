# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160920140107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appissues", force: :cascade do |t|
    t.date     "originaltimestamp"
    t.string   "uuid"
    t.string   "yourname"
    t.date     "originalmeetingdate"
    t.string   "meetingcode"
    t.integer  "issueid"
    t.string   "meetingname"
    t.string   "structure"
    t.string   "structurecounty"
    t.string   "structuredistrict"
    t.string   "status"
    t.string   "issuedistrict"
    t.string   "community"
    t.string   "category"
    t.string   "raisedby"
    t.string   "disputant"
    t.integer  "duration"
    t.text     "actionplancommittee"
    t.text     "actionplandescription"
    t.text     "actionplannotes"
    t.string   "ongoing_resolved"
    t.date     "resolutiondate"
    t.string   "report_ongoing"
    t.text     "googledocs"
    t.text     "resolution"
    t.string   "updatetype"
    t.string   "resolutiontype"
    t.date     "updatedate"
    t.text     "updatedescription"
    t.date     "mediationdate"
    t.string   "mediationoutcome"
    t.text     "issuedescription"
    t.string   "issuename"
    t.text     "issuenotes"
    t.text     "statusnotes"
    t.date     "referraldate"
    t.string   "referredto"
    t.text     "referralnote"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "userrole_id"
    t.integer  "structure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disputants", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "county_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issueactions", force: :cascade do |t|
    t.integer  "actiontype"
    t.integer  "meeting_id"
    t.integer  "mediation_id"
    t.integer  "organization_id"
    t.integer  "issue_id"
    t.text     "actionbody"
    t.integer  "user_id"
    t.integer  "structure_id"
    t.datetime "old_resolution_date"
    t.integer  "laststructure_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "structure_id"
    t.integer  "district_id"
    t.string   "location"
    t.integer  "manager_id"
    t.integer  "scope_id"
    t.text     "status_note"
    t.text     "actionplan"
    t.date     "resolution_date"
    t.string   "disputant"
    t.string   "community"
    t.integer  "category_id"
    t.string   "old_id"
    t.integer  "raised_by"
    t.text     "resolution"
    t.text     "actioncommittee"
    t.date     "cancelled_at"
    t.integer  "duration"
    t.date     "originaltimestamp"
    t.string   "originaluser"
    t.string   "uuid"
    t.integer  "resolutiontype_id"
    t.integer  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "structure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "mediations", force: :cascade do |t|
    t.string   "name"
    t.integer  "issue_id"
    t.datetime "mediation_start"
    t.datetime "mediation_end"
    t.text     "mediation_notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "mediators", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "mediation_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.date     "meeting_on"
    t.time     "meeting_start"
    t.time     "meeting_end"
    t.datetime "real_start"
    t.datetime "real_end"
    t.string   "name"
    t.string   "location"
    t.integer  "structure_id"
    t.integer  "attendees_male"
    t.integer  "attendees_females"
    t.boolean  "meeting_held"
    t.string   "old_id"
    t.integer  "duration"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "structure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.integer  "organizationtype_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "organizationtypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "phone"
    t.string   "title"
    t.string   "email"
    t.integer  "organization_id"
    t.integer  "structure_id"
    t.integer  "gender"
    t.string   "community"
    t.string   "agencyname"
    t.string   "salut"
    t.string   "suffix"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "post_type"
    t.decimal  "post_value"
    t.date     "published_at"
    t.boolean  "is_featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resolutiontypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rolepermissions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scopes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "search_term"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "technicalarea_ids"
    t.string   "targetgroup_ids"
    t.string   "organization_ids"
  end

  create_table "site_documents", force: :cascade do |t|
    t.string   "documentable_type"
    t.integer  "documentable_id"
    t.integer  "nid"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "site_images", force: :cascade do |t|
    t.string   "name"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.boolean  "is_logo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "structures", force: :cascade do |t|
    t.string   "name"
    t.integer  "structuretype"
    t.integer  "district_id"
    t.integer  "county_id"
    t.integer  "parent_id"
    t.string   "default_location"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "userroles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "structure_id"
    t.integer  "role_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.boolean  "structure_admin"
    t.boolean  "structure_manager"
    t.boolean  "system_admin"
    t.boolean  "system_manager"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
