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

ActiveRecord::Schema.define(version: 20171114175233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.date "release_date", null: false
    t.integer "quantity", null: false
    t.string "isbn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "starting_address", null: false
    t.string "destination_address", null: false
    t.uuid "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_fleets_on_driver_id"
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

  create_table "partner_donations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "value", default: 0.0, null: false
    t.string "payment_type", default: "", null: false
    t.string "item", default: "", null: false
    t.uuid "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_partner_donations_on_partner_id"
  end

  create_table "partners", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "phone_numbers", default: [], array: true
    t.string "document_cnpj", default: "", null: false
    t.string "document_state_registration", default: "", null: false
    t.string "email", default: "", null: false
    t.uuid "city_id"
    t.string "address_street", default: "", null: false
    t.string "address_number", default: "", null: false
    t.string "address_neighborhood", default: "", null: false
    t.string "address_zip_code", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_partners_on_city_id"
    t.index ["email"], name: "index_partners_on_email", unique: true
  end

  create_table "states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_appointments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "student_id"
    t.uuid "user_id"
    t.date "date", null: false
    t.time "time", null: false
    t.text "obs", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_appointments_on_student_id"
    t.index ["user_id"], name: "index_student_appointments_on_user_id"
  end

  create_table "student_schedulings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "student_id"
    t.date "date", default: "2017-11-13", null: false
    t.time "schedule", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_schedulings_on_student_id"
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
    t.uuid "city_id"
    t.string "address_street", default: "", null: false
    t.string "address_number", default: "", null: false
    t.string "address_neighborhood", default: "", null: false
    t.string "address_zip_code", default: "", null: false
    t.uuid "fleet_id"
    t.index ["city_id"], name: "index_students_on_city_id"
    t.index ["fleet_id"], name: "index_students_on_fleet_id"
  end

  create_table "supplies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "fuel"
    t.uuid "fleet_id"
    t.float "liters"
    t.float "value"
    t.date "supply_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_id"], name: "index_supplies_on_fleet_id"
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
    t.datetime "admission_date", default: "2017-11-13 04:13:46", null: false
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
  add_foreign_key "fleets", "users", column: "driver_id"
  add_foreign_key "medicines", "students"
  add_foreign_key "partner_donations", "partners"
  add_foreign_key "partners", "cities"
  add_foreign_key "student_appointments", "students"
  add_foreign_key "student_appointments", "users"
  add_foreign_key "student_schedulings", "students"
  add_foreign_key "students", "cities"
  add_foreign_key "students", "fleets"
  add_foreign_key "supplies", "fleets"
  add_foreign_key "users", "cities"
end
