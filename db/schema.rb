# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_10_135102) do

  create_table "game_entries", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "game_url"
  end

  create_table "game_votes", force: :cascade do |t|
    t.integer "game_entry_id", null: false
    t.integer "user_id", null: false
    t.integer "score"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_entry_id"], name: "index_game_votes_on_game_entry_id"
    t.index ["user_id"], name: "index_game_votes_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "game_entry_id", null: false
    t.boolean "owned"
    t.boolean "wanted"
    t.boolean "hated"
    t.string "platform"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_entry_id"], name: "index_recommendations_on_game_entry_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_votes", "game_entries"
  add_foreign_key "game_votes", "users"
  add_foreign_key "recommendations", "game_entries"
  add_foreign_key "recommendations", "users"
end
