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

ActiveRecord::Schema[8.0].define(version: 2025_03_10_161304) do
  create_table "exhibition_rooms", force: :cascade do |t|
    t.integer "exhibition_id", null: false
    t.integer "room_id", null: false
    t.integer "order", null: false
    t.index ["exhibition_id", "room_id"], name: "index_exhibition_rooms_on_exhibition_id_and_room_id", unique: true
    t.index ["exhibition_id"], name: "index_exhibition_rooms_on_exhibition_id"
    t.index ["room_id"], name: "index_exhibition_rooms_on_room_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "room_background_url"
    t.boolean "is_first_room", default: false
    t.integer "prev_room_id"
    t.integer "next_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_room_id"], name: "index_rooms_on_next_room_id"
    t.index ["prev_room_id"], name: "index_rooms_on_prev_room_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "last_activity_at"
    t.integer "current_room_id"
    t.integer "visitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_room_id"], name: "index_visits_on_current_room_id"
    t.index ["visitor_id"], name: "index_visits_on_visitor_id"
  end

  add_foreign_key "exhibition_rooms", "exhibitions"
  add_foreign_key "exhibition_rooms", "rooms"
  add_foreign_key "rooms", "rooms", column: "next_room_id"
  add_foreign_key "rooms", "rooms", column: "prev_room_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "visits", "rooms", column: "current_room_id"
  add_foreign_key "visits", "visitors"
end
