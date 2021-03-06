# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170623153733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "logo"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bar_id"
    t.index ["bar_id"], name: "index_drinks_on_bar_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "shots"
    t.integer "quantity"
    t.text "instructions"
    t.bigint "drink_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_order_items_on_drink_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "email"
    t.string "stripe_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bar_id"
    t.index ["bar_id"], name: "index_orders_on_bar_id"
  end

  add_foreign_key "drinks", "bars"
  add_foreign_key "order_items", "drinks"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "bars"
end
