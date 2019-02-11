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

ActiveRecord::Schema.define(version: 2019_02_11_215421) do

  create_table "addresses", force: :cascade do |t|
    t.string "line_1"
    t.string "line_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "sitter_id"
    t.datetime "start_date_and_time"
    t.datetime "end_date_and_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rate"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.date "dob"
    t.text "feeding_regimen"
    t.text "medication_regimen"
    t.text "other_notes"
    t.integer "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "gender"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "type"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "time_zone", default: "UTC"
    t.string "timezone", default: "America/New_York"
  end

end
