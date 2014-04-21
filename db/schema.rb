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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140421175851) do

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["category"], name: "index_groups_on_category"
  add_index "groups", ["name"], name: "index_groups_on_name"

  create_table "photos", force: true do |t|
    t.integer  "subject_id"
    t.string   "caption"
    t.datetime "created"
    t.string   "photo"
    t.string   "instagram_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["instagram_id"], name: "index_photos_on_instagram_id"
  add_index "photos", ["subject_id", "instagram_id"], name: "index_photos_on_subject_id_and_instagram_id", unique: true
  add_index "photos", ["subject_id"], name: "index_photos_on_subject_id"

  create_table "subjects", force: true do |t|
    t.integer  "group_id"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "name"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["group_id"], name: "index_subjects_on_group_id"

  create_table "tweets", force: true do |t|
    t.integer  "subject_id"
    t.string   "text"
    t.datetime "created"
    t.string   "photo"
    t.string   "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["subject_id", "tweet_id"], name: "index_tweets_on_subject_id_and_tweet_id", unique: true
  add_index "tweets", ["subject_id"], name: "index_tweets_on_subject_id"
  add_index "tweets", ["tweet_id"], name: "index_tweets_on_tweet_id"

end
