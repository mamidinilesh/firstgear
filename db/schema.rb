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

ActiveRecord::Schema.define(version: 20160826144130) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "rate_cards", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "service_id"
    t.integer  "vendor_id"
    t.decimal  "commission"
    t.boolean  "is_inclusive"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["service_id"], name: "index_rate_cards_on_service_id"
    t.index ["vehicle_id"], name: "index_rate_cards_on_vehicle_id"
    t.index ["vendor_id"], name: "index_rate_cards_on_vendor_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_regions_on_city_id"
  end

  create_table "services", force: :cascade do |t|
    t.string   "region"
    t.string   "name"
    t.integer  "category_id"
    t.integer  "default_commission"
    t.boolean  "active"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["category_id"], name: "index_services_on_category_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "v_type"
    t.integer  "brand_id"
    t.string   "model"
    t.string   "variant"
    t.string   "transmission"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["brand_id"], name: "index_vehicles_on_brand_id"
  end

  create_table "vendor_contracts", force: :cascade do |t|
    t.integer  "vendor_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "comments"
    t.decimal  "listing_fees"
    t.decimal  "listing_fees_paid"
    t.boolean  "active"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["vendor_id"], name: "index_vendor_contracts_on_vendor_id"
  end

  create_table "vendor_types", force: :cascade do |t|
    t.string   "vendor_type"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "street"
    t.integer  "region_id"
    t.integer  "city_id"
    t.integer  "state_id"
    t.decimal  "lat"
    t.decimal  "lng"
    t.decimal  "ranking"
    t.integer  "vendor_type_id"
    t.string   "contact_name_1"
    t.string   "contact_email_1"
    t.string   "contact_mob_1"
    t.string   "contact_name_2"
    t.string   "contact_email_2"
    t.string   "contact_mob_2"
    t.boolean  "listing_category"
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["city_id"], name: "index_vendors_on_city_id"
    t.index ["region_id"], name: "index_vendors_on_region_id"
    t.index ["state_id"], name: "index_vendors_on_state_id"
    t.index ["vendor_type_id"], name: "index_vendors_on_vendor_type_id"
  end

end
