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

ActiveRecord::Schema.define(version: 20160324172009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "introduction"
    t.date     "date"
    t.time     "time"
    t.string   "venue"
    t.integer  "volunteering_hour"
    t.time     "gathering_time"
    t.string   "gathering_venue"
    t.boolean  "transportation"
    t.boolean  "meal"
    t.boolean  "certificate"
    t.text     "job_scope"
    t.text     "notes"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string  "email",                             null: false
    t.string  "crypted_password"
    t.string  "salt"
    t.string  "name"
    t.integer "student_id"
    t.boolean "admin",             default: false
    t.string  "designation"
    t.string  "identity_number"
    t.string  "contact_number"
    t.string  "course"
    t.date    "course_intake"
    t.string  "emergency_contact"
    t.string  "emergency_number"
    t.date    "expiry"
    t.integer "status",            default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
