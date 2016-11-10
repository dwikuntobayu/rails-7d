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

ActiveRecord::Schema.define(version: 20161110070619) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "product_id", limit: 4
    t.string   "slug",       limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "article_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "nama",       limit: 255
    t.integer  "quantity",   limit: 4
    t.string   "price",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "photo",      limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",             limit: 255
    t.string   "password_hash",     limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "password_salt",     limit: 255
    t.string   "activation_token",  limit: 255
    t.string   "activation_status", limit: 255
    t.string   "role",              limit: 255
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "tipe",        limit: 255
    t.text     "description", limit: 65535
    t.string   "weight",      limit: 255
    t.string   "dimention",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
