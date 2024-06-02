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

ActiveRecord::Schema[7.1].define(version: 2024_05_25_181416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fish", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fishImage"
  end

  create_table "fishes_spots", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "fish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fish_id"], name: "index_fishes_spots_on_fish_id"
    t.index ["spot_id"], name: "index_fishes_spots_on_spot_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "regionImage"
  end

  create_table "spots", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotImage"
    t.bigint "region_id", null: false
    t.index ["region_id"], name: "index_spots_on_region_id"
  end

  create_table "user_spots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_user_spots_on_spot_id"
    t.index ["user_id"], name: "index_user_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fishes_spots", "fish"
  add_foreign_key "fishes_spots", "spots"
  add_foreign_key "spots", "regions"
  add_foreign_key "user_spots", "spots"
  add_foreign_key "user_spots", "users"
end
