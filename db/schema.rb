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

ActiveRecord::Schema.define(version: 2021_12_28_234149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.string "drink_type"
    t.string "glass_type"
    t.text "instructions"
    t.string "photo_url"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
    t.integer "drink_id"
    t.string "product_id", limit: 3
    t.string "quantity", limit: 21
    t.string "glass", limit: 24
  end

  create_table "drinks_products", id: false, force: :cascade do |t|
    t.bigint "drink_id"
    t.bigint "product_id"
    t.string "quantity"
    t.integer "id"
  end

  create_table "drinks_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "drink_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "subcategory"
    t.string "category"
    t.text "description"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "products_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
