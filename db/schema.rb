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

ActiveRecord::Schema.define(version: 20171112220804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "cities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "fleets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "vehicle", null: false
    t.string "license_plate", null: false
    t.string "document_renavam", null: false
    t.string "chassis", null: false
    t.string "route", null: false
    t.string "driver_name", null: false
    t.string "router", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "dosage", null: false
    t.string "time_interval", null: false
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_medicines_on_student_id"
  end

  create_table "states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.string "name", null: false
    t.date "birthday", null: false
    t.string "document_rg", default: "", null: false
    t.string "document_cpf", default: "", null: false
    t.string "phone_numbers", default: [], array: true
    t.string "gender", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.boolean "admin", default: false, null: false
    t.string "gender", limit: 1, null: false
    t.string "role", limit: 3, null: false
    t.date "birthday", null: false
    t.string "phone_numbers", default: [], array: true
    t.string "document_rg", null: false
    t.string "document_cpf", null: false
    t.string "document_cnh", null: false
    t.string "document_cns", null: false
    t.datetime "admission_date", default: "2017-11-09 22:36:10", null: false
    t.uuid "city_id"
    t.string "address_street", default: "", null: false
    t.string "address_number", default: "", null: false
    t.string "address_neighborhood", default: "", null: false
    t.string "address_zip_code", default: "", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "states"
  add_foreign_key "medicines", "students"
  add_foreign_key "users", "cities"
end
