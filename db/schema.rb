# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_18_214005) do
  create_table "appointments", force: :cascade do |t|
    t.date "date", null: false
    t.time "hour", null: false
    t.string "reason", null: false
    t.string "state"
    t.string "attended_by"
    t.integer "user_id", null: false
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.index ["branch_id"], name: "index_appointments_on_branch_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.integer "phone", null: false
    t.string "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id", null: false
    t.index ["location_id"], name: "index_branches_on_location_id"
    t.index ["name"], name: "index_branches_on_name", unique: true
    t.index ["schedule_id"], name: "index_branches_on_schedule_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "province", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "province"], name: "index_locations_on_name_and_province", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.time "monday_start"
    t.time "monday_end"
    t.time "tuesday_start"
    t.time "tuesday_end"
    t.time "wednesday_start"
    t.time "wednesday_end"
    t.time "thursday_start"
    t.time "thursday_end"
    t.time "friday_start"
    t.time "friday_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "saturday_start"
    t.time "saturday_end"
    t.time "sunday_start"
    t.time "sunday_end"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", null: false
    t.integer "assignedbranch"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "branches"
  add_foreign_key "appointments", "users"
  add_foreign_key "branches", "schedules"
end
