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

ActiveRecord::Schema.define(version: 20150421052123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "role",                   default: 0
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["invitation_token"], name: "index_admins_on_invitation_token", unique: true, using: :btree
  add_index "admins", ["invitations_count"], name: "index_admins_on_invitations_count", using: :btree
  add_index "admins", ["invited_by_id"], name: "index_admins_on_invited_by_id", using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "applicants", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
  end

  add_index "applicants", ["email"], name: "index_applicants_on_email", unique: true, using: :btree

  create_table "contact_forms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
  end

  create_table "final_decisions", force: true do |t|
    t.boolean  "admitted"
    t.integer  "decisionable_id"
    t.string   "decisionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "final_decisions", ["decisionable_id", "decisionable_type"], name: "index_final_decisions_on_decisionable_id_and_decisionable_type", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "applicant_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["applicant_id"], name: "index_identities_on_applicant_id", using: :btree

  create_table "member_roles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "members", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.integer  "member_role_id"
  end

  add_index "members", ["member_role_id"], name: "index_members_on_member_role_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "short_summary"
    t.string   "overview"
    t.string   "problem"
    t.string   "solution"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_id"
  end

  add_index "projects", ["semester_id"], name: "index_projects_on_semester_id", using: :btree

  create_table "semesters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "season"
    t.string   "year"
  end

  create_table "settings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "singleton_guard"
    t.integer  "current_semester_id"
    t.boolean  "npo_app_open"
    t.boolean  "student_app_open"
  end

  add_index "settings", ["current_semester_id"], name: "index_settings_on_current_semester_id", using: :btree
  add_index "settings", ["singleton_guard"], name: "index_settings_on_singleton_guard", unique: true, using: :btree

  create_table "student_applications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
    t.integer  "semester_id"
    t.text     "why_join"
  end

  add_index "student_applications", ["applicant_id"], name: "index_student_applications_on_applicant_id", using: :btree
  add_index "student_applications", ["semester_id"], name: "index_student_applications_on_semester_id", using: :btree

end
