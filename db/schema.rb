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

ActiveRecord::Schema.define(version: 20160803063356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cubbies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "location"
    t.string   "column"
    t.string   "row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cubbies_on_user_id", using: :btree
  end

  create_table "fulfillments", force: :cascade do |t|
    t.string   "week"
    t.boolean  "fulfilled?",      default: false
    t.integer  "subscription_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["subscription_id"], name: "index_fulfillments_on_subscription_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "package_items", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "item_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["item_id"], name: "index_package_items_on_item_id", using: :btree
    t.index ["package_id"], name: "index_package_items_on_package_id", using: :btree
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redemptions", force: :cascade do |t|
    t.integer "user_id"
    t.index ["user_id"], name: "index_redemptions_on_user_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price"
    t.string   "mod"
    t.integer  "weeks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "package_id"
    t.index ["package_id"], name: "index_subscriptions_on_package_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.integer  "role",            default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "uid"
    t.string   "oauth_token"
  end

  add_foreign_key "cubbies", "users"
  add_foreign_key "fulfillments", "subscriptions"
  add_foreign_key "package_items", "items"
  add_foreign_key "package_items", "packages"
  add_foreign_key "redemptions", "users"
  add_foreign_key "subscriptions", "packages"
  add_foreign_key "subscriptions", "users"
end
