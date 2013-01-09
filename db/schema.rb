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

ActiveRecord::Schema.define(:version => 20130109025119) do

  create_table "admins", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "amas", :force => true do |t|
    t.string   "key",                       :null => false
    t.datetime "date",                      :null => false
    t.string   "title",                     :null => false
    t.text     "content"
    t.integer  "karma",      :default => 0
    t.integer  "user_id",                   :null => false
    t.string   "permalink"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "comments",   :default => 0
    t.integer  "responses",  :default => 0
  end

  add_index "amas", ["key"], :name => "index_amas_on_key", :unique => true

  create_table "amas_users", :id => false, :force => true do |t|
    t.integer "ama_id"
    t.integer "user_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "ama_id",                    :null => false
    t.string   "key",                       :null => false
    t.integer  "user_id",                   :null => false
    t.text     "content"
    t.string   "parent_key",                :null => false
    t.datetime "date",                      :null => false
    t.integer  "karma",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "parent_id"
  end

  add_index "comments", ["key"], :name => "index_comments_on_key"

  create_table "entities", :force => true do |t|
    t.string   "name",                :null => false
    t.string   "content"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "slug",                :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "entities", ["slug"], :name => "index_entities_on_slug", :unique => true

  create_table "entities_links", :force => true do |t|
    t.integer  "entity_id"
    t.integer  "entities_links_icon_id"
    t.string   "title",                  :null => false
    t.string   "link",                   :null => false
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "entities_links_icons", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "source",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "entities_links_icons", ["name"], :name => "index_entities_links_icons_on_name", :unique => true

  create_table "entities_users", :id => false, :force => true do |t|
    t.integer "entity_id"
    t.integer "user_id"
  end

  create_table "meta", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "meta", ["name"], :name => "index_meta_on_name", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "trashes", :force => true do |t|
    t.string   "key",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trashes", ["key"], :name => "index_trashes_on_key", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username",                             :null => false
    t.string   "modhash"
    t.boolean  "active",            :default => false
    t.integer  "comment_karma",     :default => 0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "link_karma",        :default => 0
    t.string   "persistence_token"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

end
