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

ActiveRecord::Schema[7.1].define(version: 2024_06_22_154733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "list_guests", force: :cascade do |t|
    t.bigint "list_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_guests_on_list_id"
    t.index ["user_id"], name: "index_list_guests_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "access_type"
    t.float "budget"
    t.integer "status"
    t.bigint "tag_id", null: false
    t.bigint "user_id", null: false
    t.bigint "supermarket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supermarket_id"], name: "index_lists_on_supermarket_id"
    t.index ["tag_id"], name: "index_lists_on_tag_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.decimal "price"
    t.integer "quantity"
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_products_on_list_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_reviews_on_list_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "supermarkets", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "currency"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "list_guests", "lists"
  add_foreign_key "list_guests", "users"
  add_foreign_key "lists", "supermarkets"
  add_foreign_key "lists", "tags"
  add_foreign_key "lists", "users"
  add_foreign_key "products", "lists"
  add_foreign_key "reviews", "lists"
  add_foreign_key "reviews", "users"
end
