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

ActiveRecord::Schema.define(:version => 20130423174455) do

  create_table "entries", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "link",        :null => false
    t.string   "description", :null => false
    t.string   "author"
    t.string   "category"
    t.text     "comments"
    t.text     "enclosure"
    t.string   "guid"
    t.string   "pubDate"
    t.integer  "feed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "feeds", :force => true do |t|
    t.string   "title",          :null => false
    t.text     "link",           :null => false
    t.string   "description",    :null => false
    t.string   "language"
    t.string   "copyright"
    t.string   "managingEditor"
    t.string   "webMaster"
    t.date     "pubDate"
    t.date     "lastBuildDate"
    t.string   "category"
    t.string   "generator"
    t.string   "docs"
    t.integer  "ttl"
    t.text     "image"
    t.integer  "skipHours"
    t.integer  "skipDays"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "url"
  end

end
