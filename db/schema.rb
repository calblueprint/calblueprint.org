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

ActiveRecord::Schema.define(version: 2020_01_12_024543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role", default: "npo_reviewer", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["invitation_token"], name: "index_admins_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_admins_on_invitations_count"
    t.index ["invited_by_id"], name: "index_admins_on_invited_by_id"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "applicants", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.string "email", default: "", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_applicants_on_email", unique: true
  end

  create_table "comparison_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "weight"
    t.decimal "comparison_bonus"
    t.decimal "comparison_penalty"
    t.string "name"
    t.text "application_types", default: [], array: true
    t.bigint "semester_id"
    t.index ["semester_id"], name: "index_comparison_categories_on_semester_id"
  end

  create_table "comparison_category_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "comparison_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comparison_category_id"], name: "index_comparison_category_questions_on_comparison_category_id"
    t.index ["question_id"], name: "index_comparison_category_questions_on_question_id"
  end

  create_table "comparisons", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "winner_id", null: false
    t.integer "loser_id", null: false
    t.integer "admin_id", null: false
    t.bigint "comparison_category_id"
    t.index ["admin_id"], name: "index_comparisons_on_admin_id"
    t.index ["comparison_category_id"], name: "index_comparisons_on_comparison_category_id"
    t.index ["loser_id"], name: "index_comparisons_on_loser_id"
    t.index ["winner_id"], name: "index_comparisons_on_winner_id"
  end

  create_table "contact_forms", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "message"
  end

  create_table "external_applications", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "applicant_id"
    t.integer "semester_id"
    t.boolean "operations"
    t.boolean "content"
    t.boolean "design"
    t.boolean "available_for_bp_games"
    t.boolean "available_for_retreat"
    t.boolean "applied_before"
    t.text "why_no_bp_games"
    t.text "why_no_retreat"
    t.text "why_join"
    t.text "design_experience"
    t.text "experience"
    t.string "website"
    t.string "year"
    t.string "major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resume_file_name"
    t.string "resume_content_type"
    t.integer "resume_file_size"
    t.datetime "resume_updated_at"
    t.text "social_links"
    t.text "personal_growth"
    t.string "additional_option"
    t.text "commitments"
    t.boolean "outreach"
    t.string "design_portfolio_file_name"
    t.string "design_portfolio_content_type"
    t.integer "design_portfolio_file_size"
    t.datetime "design_portfolio_updated_at"
    t.string "design_portfolio_link"
  end

  create_table "holds", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "left_id", null: false
    t.integer "right_id", null: false
    t.integer "admin_id", null: false
    t.datetime "current_until"
    t.bigint "comparison_category_id"
    t.index ["admin_id"], name: "index_holds_on_admin_id"
    t.index ["comparison_category_id"], name: "index_holds_on_comparison_category_id"
    t.index ["left_id"], name: "index_holds_on_left_id"
    t.index ["right_id"], name: "index_holds_on_right_id"
  end

  create_table "nonprofit_applications", id: :serial, force: :cascade do |t|
    t.integer "nonprofit_id"
    t.integer "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "purpose"
    t.text "history"
    t.date "date_established"
    t.boolean "legal"
    t.text "short_summary"
    t.text "goals"
    t.text "key_features"
    t.string "devices"
    t.text "target_audience"
    t.text "why"
    t.boolean "cs169_pool", null: false
    t.string "client_status"
    t.text "technical_requirements"
    t.string "state", default: "draft", null: false
    t.datetime "submitted_at"
    t.text "current_resources"
    t.text "future_plans"
  end

  create_table "nonprofit_interest_forms", id: :serial, force: :cascade do |t|
    t.string "contact_name"
    t.string "phone"
    t.string "role"
    t.decimal "office_lat"
    t.decimal "office_lng"
    t.text "org_description"
    t.string "website"
    t.string "category"
    t.boolean "agree_to_terms"
    t.integer "nonprofit_id"
    t.integer "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "office"
    t.string "referrer"
  end

  create_table "nonprofits", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "organization_name"
    t.index ["email"], name: "index_nonprofits_on_email", unique: true
    t.index ["reset_password_token"], name: "index_nonprofits_on_reset_password_token", unique: true
  end

  create_table "question_semesters", force: :cascade do |t|
    t.integer "question_order"
    t.bigint "question_id"
    t.bigint "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_semesters_on_question_id"
    t.index ["semester_id"], name: "index_question_semesters_on_semester_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "hint"
    t.integer "question_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "required", default: true
    t.bigint "comparison_category_id"
    t.string "tag"
    t.integer "question_category"
    t.string "choices"
    t.string "placeholder"
    t.integer "word_limit", default: 0
    t.integer "file_size_limit", default: 10
    t.integer "input_type", default: 0
    t.index ["comparison_category_id"], name: "index_questions_on_comparison_category_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text "answer"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.bigint "student_application_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["student_application_id"], name: "index_responses_on_student_application_id"
  end

  create_table "semesters", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "season"
    t.string "year"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "singleton_guard"
    t.integer "current_semester_id"
    t.boolean "npo_app_open"
    t.boolean "dev_app_open"
    t.boolean "cs169_app_open"
    t.integer "comparison_bonus", default: 0
    t.integer "comparison_penalty", default: 0
    t.integer "comparison_threshold", default: 0
    t.integer "applicants_remaining", default: 0
    t.boolean "external_app_open", default: true
    t.boolean "npo_statement_of_interest_open"
    t.boolean "npo_project_proposal_open"
    t.boolean "notify_bar_active"
    t.text "notify_bar_content"
    t.string "notify_bar_link"
    t.integer "designer_app_open", default: 1
    t.index ["current_semester_id"], name: "index_settings_on_current_semester_id"
    t.index ["singleton_guard"], name: "index_settings_on_singleton_guard", unique: true
  end

  create_table "student_applications", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "applicant_id"
    t.integer "semester_id"
    t.text "why_join"
    t.string "resume_file_name"
    t.string "resume_content_type"
    t.integer "resume_file_size"
    t.datetime "resume_updated_at"
    t.string "year"
    t.string "phone"
    t.string "name"
    t.string "email"
    t.boolean "available_for_bp_games", default: false
    t.boolean "available_for_retreat", default: false
    t.integer "wins_count", default: 0
    t.integer "losses_count", default: 0
    t.text "experience"
    t.text "projects"
    t.text "service"
    t.text "why_no_bp_games"
    t.text "why_no_retreat"
    t.boolean "applied_before", default: false
    t.integer "version", default: 2
    t.string "design_portfolio_file_name"
    t.string "design_portfolio_content_type"
    t.integer "design_portfolio_file_size"
    t.datetime "design_portfolio_updated_at"
    t.boolean "add_to_newsletter", default: true
    t.text "hardest_achievement"
    t.text "commitments"
    t.string "heard_from"
    t.string "current_category"
    t.index ["applicant_id"], name: "index_student_applications_on_applicant_id"
    t.index ["semester_id"], name: "index_student_applications_on_semester_id"
  end

  add_foreign_key "comparison_categories", "semesters"
  add_foreign_key "comparison_category_questions", "comparison_categories"
  add_foreign_key "comparison_category_questions", "questions"
  add_foreign_key "comparisons", "comparison_categories"
  add_foreign_key "holds", "comparison_categories"
  add_foreign_key "question_semesters", "questions"
  add_foreign_key "question_semesters", "semesters"
  add_foreign_key "questions", "comparison_categories"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "student_applications"
end
