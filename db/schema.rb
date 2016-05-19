# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160519024535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "link_url"
    t.string   "link_text"
    t.string   "banner_type",       default: "complete"
    t.string   "hover_title"
    t.string   "hover_description"
    t.string   "position"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "text_link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "interior_builders", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "hover_title"
    t.string   "hover_description"
    t.string   "url_link"
    t.string   "position"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.decimal  "total",      default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "brand_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_builders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "total",      default: 0.0
    t.integer  "user_id"
    t.decimal  "subtotal",   default: 0.0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "status",     default: "in_progress"
    t.boolean  "seen",       default: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "picturable_id"
    t.string   "picturable_type"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "product_connections", id: false, force: :cascade do |t|
    t.integer "product_a_id", null: false
    t.integer "product_b_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "model_id"
    t.string   "name"
    t.string   "code"
    t.decimal  "regular_price"
    t.decimal  "offer_price"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "collection_id"
    t.boolean  "on_offer",      default: false
    t.decimal  "premium_price", default: 0.0
  end

  create_table "slider_brand_items", force: :cascade do |t|
    t.integer  "slider_id"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slider_brands", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "title"
    t.string   "url_link"
    t.string   "description"
    t.string   "link_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "encrypted_password",       default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "role",                     default: "regular"
    t.string   "phone_number"
    t.string   "address"
    t.string   "cell_phone"
    t.string   "company"
    t.string   "hear_about_us"
    t.boolean  "subscribed_to_newsletter", default: false
    t.string   "status",                   default: "inactive"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
