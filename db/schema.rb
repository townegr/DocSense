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

ActiveRecord::Schema.define(version: 20140411015648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encounters", force: true do |t|
    t.text    "notes"
    t.integer "procedure_id", null: false
    t.integer "patient_id",   null: false
    t.integer "user_id",      null: false
  end

  add_index "encounters", ["patient_id"], name: "index_encounters_on_patient_id", using: :btree
  add_index "encounters", ["procedure_id"], name: "index_encounters_on_procedure_id", using: :btree
  add_index "encounters", ["user_id"], name: "index_encounters_on_user_id", using: :btree

  create_table "patients", force: true do |t|
    t.string "name",               null: false
    t.string "insurance_provider"
    t.date   "date_of_birth"
    t.string "primary_md"
  end

  create_table "procedures", force: true do |t|
    t.string  "code",                                null: false
    t.string  "description",                         null: false
    t.decimal "work_rvu",    precision: 5, scale: 2, null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                 null: false
    t.string   "encrypted_password",     default: "",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                                          null: false
    t.string   "last_name",                                           null: false
    t.string   "job_title",              default: "Medical Provider", null: false
    t.integer  "dollar_per_rvu",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
