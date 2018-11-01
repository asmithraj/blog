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

ActiveRecord::Schema.define(version: 20181029064505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
  end

  create_table "bls", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "command_instances", force: :cascade do |t|
    t.integer  "process_id"
    t.string   "file_id"
    t.string   "output"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "command_name"
    t.integer  "status"
    t.integer  "command_id"
    t.string   "commandtype"
    t.string   "machine_name"
    t.index ["command_id"], name: "index_command_instances_on_command_id", using: :btree
  end

  create_table "commands", force: :cascade do |t|
    t.string   "name"
    t.string   "command"
    t.string   "file_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "description"
    t.integer  "user_id"
    t.string   "remote_location"
    t.string   "commandtype"
    t.string   "dest_location"
    t.string   "parameter"
    t.index ["user_id"], name: "index_commands_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
  end

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "username"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_machines_on_user_id", using: :btree
  end

  create_table "scp_commands", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "remote_location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "command_id"
    t.integer  "user_id"
    t.string   "commandtype"
    t.index ["command_id"], name: "index_scp_commands_on_command_id", using: :btree
    t.index ["user_id"], name: "index_scp_commands_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "role"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "comments", "articles"
end
