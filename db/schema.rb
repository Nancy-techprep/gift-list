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

ActiveRecord::Schema.define(version: 2023_05_08_191938) do

  create_table "gifts", force: :cascade do |t|
    t.integer "occasion_id"
    t.integer "user_id"
    t.text "note"
    t.integer "loved_one_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loved_ones", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "relationship"
    t.integer "occasions_count"
    t.integer "gifts_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "occasions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "loved_one_id"
    t.string "name"
    t.date "date"
    t.integer "gifts_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "loved_ones_count"
    t.integer "occasions_count"
    t.integer "gifts_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
  end

end
