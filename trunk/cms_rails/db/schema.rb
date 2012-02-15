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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120215003832) do

  create_table "announcements", :force => true do |t|
    t.integer  "user_id"
    t.string   "topic"
    t.text     "content"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.datetime "started_at"
    t.datetime "ending_at"
    t.string   "name"
    t.text     "destription"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "name"
    t.integer  "version"
    t.string   "description"
    t.string   "location"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "full_name"
    t.string   "pref_name"
    t.string   "email"
    t.boolean  "admin"
    t.string   "pass_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_projects", :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

end
