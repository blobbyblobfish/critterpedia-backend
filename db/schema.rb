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

ActiveRecord::Schema.define(version: 2020_07_08_160222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "critters", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "img_url"
    t.integer "nh_available_months", array: true
    t.integer "sh_available_months", array: true
    t.integer "available_times", array: true
  end

  create_table "user_critters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "critter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["critter_id"], name: "index_user_critters_on_critter_id"
    t.index ["user_id"], name: "index_user_critters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "hemisphere"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_critters", "critters"
  add_foreign_key "user_critters", "users"
end
