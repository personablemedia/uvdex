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

ActiveRecord::Schema.define(version: 20140630142039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "vehicle_photos", force: true do |t|
    t.string   "google_drive_file_name"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "default"
  end

  create_table "vehicles", force: true do |t|
    t.string   "stock"
    t.string   "new_used"
    t.string   "year"
    t.string   "sold"
    t.string   "model"
    t.string   "features"
    t.string   "color"
    t.string   "vin"
    t.string   "scheduled"
    t.float    "price"
    t.float    "msrp"
    t.string   "condition"
    t.integer  "passengers"
    t.string   "copy"
    t.string   "website"
    t.string   "make"
    t.string   "pkg"
    t.integer  "miles"
    t.string   "code"
    t.string   "previous_owner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_used"
    t.boolean  "published"
  end

end
