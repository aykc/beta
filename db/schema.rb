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

ActiveRecord::Schema.define(version: 20160914063803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "integer_values", force: :cascade do |t|
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  create_table "items_option_values", force: :cascade do |t|
    t.integer "item_id"
    t.integer "option_value_id"
    t.index ["item_id"], name: "index_items_option_values_on_item_id", using: :btree
    t.index ["option_value_id"], name: "index_items_option_values_on_option_value_id", using: :btree
  end

  create_table "option_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_option_groups_on_category_id", using: :btree
  end

  create_table "option_values", force: :cascade do |t|
    t.integer  "option_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "value_element_id"
    t.string   "value_element_type"
    t.index ["option_id"], name: "index_option_values_on_option_id", using: :btree
    t.index ["value_element_type", "value_element_id"], name: "index_option_values_on_value_element_type_and_value_element_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.integer  "option_group_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "option_element_id"
    t.string   "option_element_type"
    t.string   "value_type"
    t.index ["option_element_type", "option_element_id"], name: "index_options_on_option_element_type_and_option_element_id", using: :btree
    t.index ["option_group_id"], name: "index_options_on_option_group_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.jsonb    "details",     default: "{}", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["details"], name: "index_products_on_details", using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "option_value_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["item_id"], name: "index_properties_on_item_id", using: :btree
    t.index ["option_value_id"], name: "index_properties_on_option_value_id", using: :btree
  end

  create_table "select_options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "string_values", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "categories"
  add_foreign_key "items_option_values", "items"
  add_foreign_key "items_option_values", "option_values"
  add_foreign_key "option_groups", "categories"
  add_foreign_key "option_values", "options"
  add_foreign_key "options", "option_groups"
  add_foreign_key "products", "categories"
  add_foreign_key "properties", "items"
  add_foreign_key "properties", "option_values"
end
