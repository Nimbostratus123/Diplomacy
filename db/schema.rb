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

ActiveRecord::Schema.define(:version => 20130914144713) do

  create_table "centers", :force => true do |t|
    t.string   "nation"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "moves", :force => true do |t|
    t.string   "origin"
    t.string   "destination"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "moves", ["user_id", "created_at"], :name => "index_moves_on_user_id_and_created_at"

  create_table "units", :force => true do |t|
    t.string   "kind"
    t.string   "location"
    t.float    "delay"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "destination"
    t.string   "latest"
    t.integer  "support"
    t.string   "supporting"
  end

  add_index "units", ["user_id", "created_at"], :name => "index_units_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "nation"
    t.string   "bio"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "years", :force => true do |t|
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
