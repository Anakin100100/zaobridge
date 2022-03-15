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

ActiveRecord::Schema[7.0].define(version: 2022_03_13_145443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sets", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_game_sets_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "event"
    t.string "site"
    t.datetime "date"
    t.string "board"
    t.string "west_player"
    t.string "north_player"
    t.string "east_player"
    t.string "south_player"
    t.string "vulnerable", null: false
    t.string "deal", null: false
    t.string "scoring"
    t.string "declarer", null: false
    t.string "contract"
    t.string "result"
    t.string "auction"
    t.text "auction_notes"
    t.string "play"
    t.text "general_notes"
    t.bigint "game_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_set_id"], name: "index_games_on_game_set_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
