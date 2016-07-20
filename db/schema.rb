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

ActiveRecord::Schema.define(version: 20160720003152) do

  create_table "contracts", force: :cascade do |t|
    t.integer  "number"
    t.integer  "request_number"
    t.string   "customer"
    t.string   "address"
    t.string   "contact"
    t.integer  "deadline"
    t.text     "equipment"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "discount"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.integer  "serial_number"
    t.string   "supplier"
    t.string   "category"
    t.float    "price"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "code"
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
