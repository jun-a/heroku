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

ActiveRecord::Schema.define(version: 20150919192740) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.string   "url",                limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "media_id",           limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "member_id",          limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "community_comments", force: :cascade do |t|
    t.text     "comment",            limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "community_id",       limit: 4
    t.integer  "member_id",          limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employment_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.datetime "event_day"
    t.integer  "community_id",       limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "member_id",          limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "article_id",         limit: 4
    t.string   "type",               limit: 255
    t.text     "body",               limit: 65535
    t.integer  "sortkey",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "main_departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "member_messages", force: :cascade do |t|
    t.string   "message",         limit: 255
    t.integer  "from_member_id",  limit: 4,   null: false
    t.integer  "to_member_id",    limit: 4,   null: false
    t.integer  "message_icon_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "member_messages", ["from_member_id", "to_member_id"], name: "index_member_messages_on_from_member_id_and_to_member_id", using: :btree
  add_index "member_messages", ["from_member_id"], name: "index_member_messages_on_from_member_id", using: :btree
  add_index "member_messages", ["to_member_id"], name: "index_member_messages_on_to_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",         null: false
    t.string   "encrypted_password",     limit: 255,                        null: false
    t.string   "name",                   limit: 255,   default: "リジョブユーザー", null: false
    t.string   "image_file_name",        limit: 255
    t.string   "image_content_type",     limit: 255
    t.integer  "image_file_size",        limit: 4
    t.datetime "image_updated_at"
    t.string   "kana",                   limit: 255
    t.string   "password",               limit: 255
    t.date     "entry_year"
    t.string   "chatwork_id",            limit: 255,   default: ""
    t.date     "birthday"
    t.integer  "birthday_month",         limit: 4
    t.integer  "indoor_call",            limit: 4
    t.text     "profile_message",        limit: 65535
    t.string   "hobby",                  limit: 255
    t.text     "job",                    limit: 65535
    t.boolean  "admin",                  limit: 1,     default: false
    t.integer  "main_department_id",     limit: 4
    t.integer  "prefecture_id",          limit: 4
    t.integer  "employment_status_id",   limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "token",                  limit: 255
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "members_communities", force: :cascade do |t|
    t.integer  "member_id",    limit: 4, null: false
    t.integer  "community_id", limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "members_departments", force: :cascade do |t|
    t.integer  "member_id",     limit: 4, null: false
    t.integer  "department_id", limit: 4, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "members_events", force: :cascade do |t|
    t.integer  "member_id",  limit: 4, null: false
    t.integer  "event_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "message_icons", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.string   "icon",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "content",       limit: 65535
    t.date     "end_date"
    t.integer  "member_id",     limit: 4
    t.integer  "department_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "news_comments", force: :cascade do |t|
    t.integer  "news_id",         limit: 4
    t.integer  "member_id",       limit: 4
    t.integer  "news_comment_id", limit: 4
    t.text     "comment",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
