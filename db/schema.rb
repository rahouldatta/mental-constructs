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

ActiveRecord::Schema.define(:version => 20130415173218) do

  create_table "cognitions", :force => true do |t|
    t.integer  "thinker_id"
    t.string   "type"
    t.text     "cognition"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "remembralls", :force => true do |t|
    t.integer  "thinker_id"
    t.text     "task"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "thinkers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "alias"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "gender"
  end

  add_index "thinkers", ["email"], :name => "index_thinkers_on_email", :unique => true
  add_index "thinkers", ["reset_password_token"], :name => "index_thinkers_on_reset_password_token", :unique => true

end
