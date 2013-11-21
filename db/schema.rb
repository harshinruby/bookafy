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

ActiveRecord::Schema.define(version: 20131120132746) do

  create_table "allocations", force: true do |t|
    t.integer  "service_id"
    t.integer  "worker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: true do |t|
    t.integer  "client_id"
    t.integer  "worker_id"
    t.integer  "category_id"
    t.integer  "service_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "appointment_start_time"
    t.datetime "appointment_end_time"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "business_name"
    t.string   "business_type"
    t.string   "business_address"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "dob"
    t.string   "mobile"
    t.string   "email"
    t.integer  "client_id"
    t.integer  "booker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.text     "description"
    t.boolean  "all_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebookers", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "business_name"
    t.string   "business_type"
    t.string   "business_address"
    t.string   "location"
    t.string   "gender"
    t.string   "image"
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 10, scale: 0
    t.integer  "services"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "service_name"
    t.integer  "price"
    t.string   "description"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "plan_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
  end

  create_table "team_leaders", force: true do |t|
    t.integer  "number_of_workers"
    t.integer  "client_id"
    t.integer  "facebooker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "age"
    t.string   "mobile_number"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.integer  "zip"
    t.string   "image"
    t.string   "time_zone"
    t.integer  "role_id"
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_hours", force: true do |t|
    t.string   "day"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "role_id"
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", force: true do |t|
    t.string   "alias"
    t.integer  "client_id"
    t.integer  "team_leader_id"
    t.integer  "faceboooker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
