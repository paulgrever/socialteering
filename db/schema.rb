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

ActiveRecord::Schema.define(version: 20150430230706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.float  "distance"
    t.string "url"
    t.string "address"
    t.float  "latitude"
    t.float  "longitude"
    t.string "phone"
    t.string "display_phone"
    t.string "image_url"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "event_date"
    t.time     "event_start"
    t.time     "event_end"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "organization_id"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "short_description"
    t.text     "long_description"
    t.string   "image_url",         default: "socialteering_placeholder.png"
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "ein"
    t.string   "name"
    t.string   "stein"
    t.string   "careofname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "organization_type"
    t.string   "phone_number"
    t.string   "email"
    t.boolean  "verified"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "google_plus_url"
    t.text     "description"
    t.string   "website"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "login"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image"
    t.string   "full_name"
    t.string   "gender"
    t.string   "facebook_page"
    t.string   "location"
  end

end
