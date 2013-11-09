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

ActiveRecord::Schema.define(:version => 20131109202106) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.boolean  "is_visible"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "content"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "kind"
    t.string   "page_title"
    t.integer  "category_id",                     :null => false
    t.integer  "position"
    t.string   "color_class"
    t.boolean  "is_deletable", :default => true
    t.boolean  "is_hidden",    :default => false
  end

  create_table "lit_locales", :force => true do |t|
    t.string   "locale"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "is_hidden",  :default => false
  end

  create_table "lit_localization_keys", :force => true do |t|
    t.string   "localization_key"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "is_completed",     :default => false
    t.boolean  "is_starred",       :default => false
  end

  add_index "lit_localization_keys", ["localization_key"], :name => "index_lit_localization_keys_on_localization_key", :unique => true

  create_table "lit_localizations", :force => true do |t|
    t.integer  "locale_id"
    t.integer  "localization_key_id"
    t.text     "default_value"
    t.text     "translated_value"
    t.boolean  "is_changed",          :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "lit_localizations", ["locale_id"], :name => "index_lit_localizations_on_locale_id"
  add_index "lit_localizations", ["localization_key_id"], :name => "index_lit_localizations_on_localization_key_id"

  create_table "profiles", :force => true do |t|
    t.string   "url"
    t.integer  "song_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
