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

ActiveRecord::Schema.define(:version => 20120709202850) do

  create_table "attachments", :force => true do |t|
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collaborations", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "collaborations", ["collection_id"], :name => "index_collaborations_on_collection_id"
  add_index "collaborations", ["user_id", "collection_id"], :name => "index_collaborations_on_user_id_and_collection_id", :unique => true
  add_index "collaborations", ["user_id"], :name => "index_collaborations_on_user_id"

  create_table "collections", :force => true do |t|
    t.integer  "user_id"
    t.string   "title",       :default => ""
    t.string   "description", :default => ""
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "category_id", :default => 2
    t.string   "needs",       :default => ""
    t.boolean  "promoted",    :default => false
  end

  add_index "collections", ["user_id"], :name => "index_collections_on_user_id"

  create_table "conversations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "interlocutor_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "conversations", ["interlocutor_id"], :name => "index_conversations_on_interlocutor_id"
  add_index "conversations", ["user_id", "interlocutor_id"], :name => "index_conversations_on_user_id_and_interlocutor_id", :unique => true
  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "extras", :force => true do |t|
    t.integer  "user_id"
    t.integer  "notifications", :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "extras", ["user_id"], :name => "index_extras_on_user_id", :unique => true

  create_table "items", :force => true do |t|
    t.integer  "collection_id"
    t.text     "content"
    t.text     "content_html"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "kind",          :default => 0
  end

  add_index "items", ["collection_id"], :name => "index_items_on_collection_id"

  create_table "lines", :force => true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "text",            :default => ""
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "remember_token"
    t.string   "provider",        :default => ""
    t.boolean  "admin",           :default => false
    t.integer  "uid",             :default => 0
    t.string   "about",           :default => ""
    t.string   "city",            :default => ""
    t.integer  "category_id",     :default => 2
    t.integer  "subcategory_id",  :default => 2
    t.string   "link_a",          :default => ""
    t.string   "link_b",          :default => ""
    t.string   "link_c",          :default => ""
    t.string   "link_d",          :default => ""
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end