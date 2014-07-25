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

ActiveRecord::Schema.define(version: 20140725190007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_followings", force: true do |t|
    t.string   "project_title", null: false
    t.integer  "follower_id",   null: false
    t.integer  "project_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_followings", ["follower_id"], name: "index_project_followings_on_follower_id", using: :btree
  add_index "project_followings", ["project_id"], name: "index_project_followings_on_project_id", using: :btree

  create_table "project_fundings", force: true do |t|
    t.string   "project_title", null: false
    t.integer  "amount_funded", null: false
    t.integer  "project_id",    null: false
    t.integer  "funder_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_fundings", ["funder_id"], name: "index_project_fundings_on_funder_id", using: :btree
  add_index "project_fundings", ["project_id"], name: "index_project_fundings_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.integer  "founder_id",                null: false
    t.string   "title",                     null: false
    t.text     "description",               null: false
    t.integer  "funding_goal",              null: false
    t.integer  "amount_raised", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration",                  null: false
    t.text     "website"
    t.string   "category",                  null: false
    t.string   "founder_name",              null: false
  end

  add_index "projects", ["founder_id"], name: "index_projects_on_founder_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "location"
    t.text     "biography"
    t.text     "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
