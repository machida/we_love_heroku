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

ActiveRecord::Schema.define(:version => 20120212130021) do

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "providers", ["name"], :name => "idx_name_on_providers", :unique => true

  create_table "providers_users", :force => true do |t|
    t.integer  "provider_id",   :null => false
    t.integer  "user_id",       :null => false
    t.string   "user_key",      :null => false
    t.string   "access_token",  :null => false
    t.string   "refresh_token"
    t.string   "secret"
    t.string   "name",          :null => false
    t.string   "email"
    t.string   "image"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "providers_users", ["provider_id", "user_key"], :name => "idx_provider_id_user_key_on_providers_users", :unique => true
  add_index "providers_users", ["user_id"], :name => "idx_user_id_on_providers_users"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "description"
    t.string   "creator"
    t.string   "hash_tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "repository_url"
    t.integer  "user_id"
  end

  add_index "sites", ["user_id"], :name => "idx_user_id_on_sites"

  create_table "users", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "image",                               :null => false
    t.integer  "default_provider_id", :default => 1,  :null => false
    t.string   "email",               :default => "", :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["email"], :name => "idx_email_on_users", :unique => true

end
