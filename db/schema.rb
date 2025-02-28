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

ActiveRecord::Schema[8.0].define(version: 2025_02_25_141932) do
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

  add_foreign_key "rooms", "rooms", column: "next_room_id"
  add_foreign_key "rooms", "rooms", column: "prev_room_id"
  add_foreign_key "sessions", "users"
end
