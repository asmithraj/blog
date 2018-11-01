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

ActiveRecord::Schema.define(version: 20180831033459) do

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
    t.index ["command_id"], name: "index_command_instances_on_command_id"
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
    t.index ["user_id"], name: "index_commands_on_user_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "username"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_machines_on_user_id"
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
    t.index ["command_id"], name: "index_scp_commands_on_command_id"
    t.index ["user_id"], name: "index_scp_commands_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "user_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
