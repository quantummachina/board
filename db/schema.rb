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

ActiveRecord::Schema.define(:version => 20130504204842) do

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

  create_table "cfollowings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cfollowed_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cities", :force => true do |t|
    t.integer "state_id"
    t.string  "name"
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
    t.string   "title",                       :default => ""
    t.text     "description",  :limit => 255, :default => ""
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "category_id",                 :default => 2
    t.boolean  "promoted",                    :default => false
    t.integer  "cover",                       :default => 0
    t.text     "conclusion",                  :default => ""
    t.integer  "status",                      :default => 0
    t.string   "idea",                        :default => ""
    t.boolean  "quarantine",                  :default => false
    t.text     "contribution",                :default => ""
    t.integer  "city_id",                     :default => 0
    t.text     "site",                        :default => ""
    t.text     "statustext",                  :default => ""
    t.text     "story",                       :default => ""
    t.text     "goal",                        :default => ""
    t.date     "end_date",                    :default => '2013-05-03'
    t.boolean  "profitable",                  :default => false
  end

  add_index "collections", ["user_id"], :name => "index_collections_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "collection_id"
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "conversations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "interlocutor_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "unread",          :default => 0
  end

  add_index "conversations", ["interlocutor_id"], :name => "index_conversations_on_interlocutor_id"
  add_index "conversations", ["user_id", "interlocutor_id"], :name => "index_conversations_on_user_id_and_interlocutor_id", :unique => true
  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "externallinks", :force => true do |t|
    t.integer  "collection_id"
    t.text     "link"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "extras", :force => true do |t|
    t.integer  "user_id"
    t.integer  "notifications", :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "messages",      :default => 0
    t.integer  "requests",      :default => 0
    t.boolean  "newboard",      :default => false
  end

  add_index "extras", ["user_id"], :name => "index_extras_on_user_id", :unique => true

  create_table "genvars", :force => true do |t|
    t.string   "name",       :default => ""
    t.integer  "value",      :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "icomments", :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "collection_id"
    t.text     "content"
    t.text     "content_html"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "kind",          :default => 0
    t.integer  "urltype",       :default => 0
    t.string   "og_image",      :default => ""
    t.text     "pre_content",   :default => ""
    t.integer  "user_id",       :default => 0
  end

  add_index "items", ["collection_id"], :name => "index_items_on_collection_id"

  create_table "lines", :force => true do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "text",            :default => ""
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.text     "message",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "pendingusers", :force => true do |t|
    t.string   "email"
    t.integer  "from"
    t.integer  "collection"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "from_id"
    t.integer  "collection_id"
    t.integer  "vacant_id"
    t.text     "message",       :limit => 255, :default => ""
    t.boolean  "invite"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "sections", :force => true do |t|
    t.text     "name",       :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "sprojects", :force => true do |t|
    t.integer  "collection_id"
    t.text     "text",          :default => ""
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "states", :force => true do |t|
    t.string "name"
  end

  create_table "tls", :force => true do |t|
    t.integer  "section_id"
    t.integer  "i",                         :default => 0
    t.text     "t",          :limit => 255, :default => ""
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "ufollowings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ufollowed_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "uoptions", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "n_requests",    :default => true
    t.boolean  "n_messages",    :default => true
    t.boolean  "n_comments",    :default => true
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "n_cfollowers",  :default => true
    t.boolean  "n_ufollowers",  :default => true
    t.boolean  "n_cfollowings", :default => true
    t.boolean  "n_ufollowings", :default => true
    t.boolean  "n_items",       :default => true
    t.integer  "temp_pay",      :default => 0
  end

  add_index "uoptions", ["user_id"], :name => "index_uoptions_on_user_id", :unique => true

# Could not dump table "users" because of following StandardError
#   Unknown type 'long' for column 'uid'

  create_table "vacants", :force => true do |t|
    t.integer  "collection_id"
    t.string   "title",         :default => ""
    t.string   "description",   :default => ""
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.text     "reward",        :default => ""
    t.integer  "pay",           :default => 0
  end

end
