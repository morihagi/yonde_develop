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

ActiveRecord::Schema[7.0].define(version: 2023_08_02_205814) do
  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "email_for_post"
    t.string "prefecture"
    t.string "city"
    t.string "radio_name"
    t.string "zip_code"
    t.string "other_address"
    t.string "legal_name"
    t.string "favorite_status", default: "unlike", null: false
    t.string "post_status", default: "draft", null: false
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "segment_id", null: false
    t.integer "phone"
    t.index ["segment_id"], name: "index_posts_on_segment_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "prefecture"
    t.string "city"
    t.string "radio_name"
    t.string "zip_code"
    t.string "other_address"
    t.string "legal_name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "program", null: false
    t.string "personality", null: false
    t.string "email", null: false
    t.string "image_url", null: false
    t.string "official_site", null: false
    t.string "day", null: false
    t.string "starting_time", null: false
    t.string "program_status", default: "ongoing", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segments", force: :cascade do |t|
    t.string "segment_title", null: false
    t.string "segment_status", default: "ongoing", null: false
    t.string "segment_title_for_email", null: false
    t.text "instruction"
    t.text "official_site_instruction"
    t.string "default_sentence"
    t.string "novelty_goods", default: "none", null: false
    t.integer "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_segments_on_program_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider"
    t.string "uid"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "posts", "segments"
  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "segments", "programs"
  add_foreign_key "tokens", "users"
end
