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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.text "text", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "like", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "post", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.string "title", limit: 255, null: false
    t.text "text", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.integer "comments_counter", default: 0
    t.integer "likes_counter", default: 0
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "photo", limit: 255
    t.string "bio", limit: 255
    t.datetime "updated_at", precision: nil, default: -> { "now()" }
    t.datetime "created_at", precision: nil, default: -> { "now()" }
    t.integer "posts_counter"
    t.index ["name"], name: "users_name_key", unique: true
  end

  add_foreign_key "comment", "post", name: "comment_post_id_fkey"
  add_foreign_key "comment", "users", name: "comment_user_id_fkey"
  add_foreign_key "like", "post", name: "like_post_id_fkey"
  add_foreign_key "like", "users", name: "like_user_id_fkey"
  add_foreign_key "post", "users", column: "author_id", name: "post_author_id_fkey"
end
