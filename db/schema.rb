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

ActiveRecord::Schema.define(:version => 20130422201932) do

  create_table "brain_storm_sessions", :force => true do |t|
    t.integer  "construct_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "thinker_id"
    t.string   "session_title"
  end

  create_table "cognitions", :force => true do |t|
    t.integer  "thinker_id"
    t.string   "type"
    t.text     "cognition"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "affinity_level"
  end

  create_table "constructs", :force => true do |t|
    t.integer  "thinker_id"
    t.integer  "dossier_id"
    t.string   "title"
    t.text     "construct"
    t.text     "foot_notes"
    t.integer  "affinity_level"
    t.boolean  "share"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "dossiers", :force => true do |t|
    t.integer  "thinker_id"
    t.string   "type"
    t.string   "dossier_name"
    t.integer  "dossier_quality"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "flashes", :force => true do |t|
    t.integer  "brain_storm_session_id"
    t.text     "flash"
    t.text     "sub_points"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "link_hoards", :force => true do |t|
    t.integer  "thinker_id"
    t.text     "link"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "remembralls", :force => true do |t|
    t.integer  "thinker_id"
    t.text     "task"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "status"
  end

  create_table "thinkers", :force => true do |t|
    t.string   "email",                       :default => "", :null => false
    t.string   "encrypted_password",          :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "alias"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "gender"
    t.integer  "last_brain_storm_session_id"
  end

  add_index "thinkers", ["email"], :name => "index_thinkers_on_email", :unique => true
  add_index "thinkers", ["reset_password_token"], :name => "index_thinkers_on_reset_password_token", :unique => true

end
