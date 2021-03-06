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

ActiveRecord::Schema.define(version: 2019_12_30_191813) do

  create_table "car_categories", force: :cascade do |t|
    t.string "name"
    t.decimal "daily_rate"
    t.decimal "car_insurance"
    t.decimal "third_party_insurance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.integer "Manufacturer_id"
    t.string "motorization"
    t.integer "CarCategory_id"
    t.string "fuel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["CarCategory_id"], name: "index_car_models_on_CarCategory_id"
    t.index ["Manufacturer_id"], name: "index_car_models_on_Manufacturer_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
