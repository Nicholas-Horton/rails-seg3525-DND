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

ActiveRecord::Schema.define(version: 20150723020214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creatures", force: true do |t|
    t.string   "name"
    t.integer  "armor_class"
    t.integer  "hitpoints"
    t.integer  "speed"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "constitution"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.string   "saving_throw"
    t.string   "damage_immunities"
    t.string   "condition_immunities"
    t.string   "senses"
    t.string   "languages"
    t.float    "challenge_rating"
    t.integer  "experience"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "encounters", force: true do |t|
    t.integer  "campaign_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spells", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "spell_class"
    t.integer  "level"
    t.string   "school"
    t.boolean  "ritual"
    t.string   "casting_time"
    t.string   "components"
    t.boolean  "concentration"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "range"
    t.string   "duration"
    t.text     "material_components"
  end

  create_table "users", force: true do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
