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

ActiveRecord::Schema.define(version: 20160822015108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255, default: "",             null: false
    t.string   "encrypted_password",     limit: 255, default: ""
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "role",                               default: "npo_reviewer", null: false
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",                  default: 0
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["invitation_token"], name: "index_admins_on_invitation_token", unique: true, using: :btree
  add_index "admins", ["invitations_count"], name: "index_admins_on_invitations_count", using: :btree
  add_index "admins", ["invited_by_id"], name: "index_admins_on_invited_by_id", using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "applicants", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255, default: "", null: false
    t.datetime "remember_created_at"
  end

  add_index "applicants", ["email"], name: "index_applicants_on_email", unique: true, using: :btree

  create_table "comparisons", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winner_id",  null: false
    t.integer  "loser_id",   null: false
    t.integer  "admin_id",   null: false
  end

  add_index "comparisons", ["admin_id"], name: "index_comparisons_on_admin_id", using: :btree
  add_index "comparisons", ["loser_id"], name: "index_comparisons_on_loser_id", using: :btree
  add_index "comparisons", ["winner_id"], name: "index_comparisons_on_winner_id", using: :btree

  create_table "contact_forms", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "subject",    limit: 255
    t.text     "message"
  end

  create_table "nonprofit_applications", force: :cascade do |t|
    t.integer  "nonprofit_id"
    t.integer  "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "purpose"
    t.text     "history"
    t.date     "date_established"
    t.boolean  "legal"
    t.text     "short_summary"
    t.text     "goals"
    t.text     "key_features"
    t.string   "devices",                limit: 255
    t.text     "target_audience"
    t.text     "why"
    t.boolean  "cs169_pool",                                           null: false
    t.string   "client_status"
    t.text     "technical_requirements"
    t.string   "state",                              default: "draft", null: false
    t.datetime "submitted_at"
  end

  create_table "nonprofits", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organization_name",      limit: 255
  end

  add_index "nonprofits", ["email"], name: "index_nonprofits_on_email", unique: true, using: :btree
  add_index "nonprofits", ["reset_password_token"], name: "index_nonprofits_on_reset_password_token", unique: true, using: :btree

  create_table "semesters", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "season",     limit: 255
    t.string   "year",       limit: 255
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "singleton_guard"
    t.integer  "current_semester_id"
    t.boolean  "npo_app_open"
    t.boolean  "student_app_open"
    t.boolean  "cs169_app_open"
    t.integer  "comparison_bonus",     default: 0
    t.integer  "comparison_penalty",   default: 0
    t.integer  "comparison_threshold", default: 0
    t.integer  "applicants_remaining", default: 0
  end

  add_index "settings", ["current_semester_id"], name: "index_settings_on_current_semester_id", using: :btree
  add_index "settings", ["singleton_guard"], name: "index_settings_on_singleton_guard", unique: true, using: :btree

  create_table "student_applications", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
    t.integer  "semester_id"
    t.text     "why_join"
    t.string   "resume_file_name",       limit: 255
    t.string   "resume_content_type",    limit: 255
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "year",                   limit: 255
    t.string   "phone",                  limit: 255
    t.string   "name"
    t.string   "email"
    t.boolean  "available_for_bp_games",             default: false
    t.boolean  "available_for_retreat",              default: false
    t.integer  "wins_count",                         default: 0
    t.integer  "losses_count",                       default: 0
    t.text     "why_you"
    t.text     "experience"
    t.text     "projects"
    t.text     "service"
    t.text     "why_no_bp_games"
    t.text     "why_no_retreat"
    t.boolean  "applied_before",                     default: false
    t.integer  "version",                            default: 2
  end

  add_index "student_applications", ["applicant_id"], name: "index_student_applications_on_applicant_id", using: :btree
  add_index "student_applications", ["semester_id"], name: "index_student_applications_on_semester_id", using: :btree

end
