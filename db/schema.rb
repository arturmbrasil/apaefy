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

  create_table "abastecimentos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "combustivel"
    t.uuid "fleets_id"
    t.float "litros"
    t.float "valor"
    t.date "data_abastecimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleets_id"], name: "index_abastecimentos_on_fleets_id"
  end

  create_table "action_plans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "data"
    t.string "evolucao"
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_action_plans_on_student_id"
  end

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "logradouro"
    t.integer "numero"
    t.string "cep"
    t.string "bairro"
    t.uuid "city_id"
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["student_id"], name: "index_addresses_on_student_id"
  end

  create_table "appointments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "data"
    t.time "horario"
    t.uuid "student_id"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_appointments_on_student_id"
  end

  create_table "cities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "colaboradors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.date "data_nascimento"
    t.string "rg"
    t.string "cpf"
    t.string "telefone"
    t.string "sexo"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.uuid "city_id"
    t.string "address_street", default: "", null: false
    t.string "address_number", default: "", null: false
    t.string "address_neighborhood", default: "", null: false
    t.string "address_zip_code", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_colaboradors_on_city_id"
  end

  create_table "conta_a_pagars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "dt_vencimento"
    t.string "nome"
    t.integer "nr_nota"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conta_a_recebers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "data"
    t.string "nome"
    t.float "valor"
    t.uuid "doacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doacao_id"], name: "index_conta_a_recebers_on_doacao_id"
  end

  create_table "doacaos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "valor"
    t.string "forma_pagamento"
    t.uuid "parceiro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parceiro_id"], name: "index_doacaos_on_parceiro_id"
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

  create_table "food_restrictions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "restriction"
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_food_restrictions_on_student_id"
  end

  create_table "fornecedors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.string "telefone"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.text "centro_custo"
    t.string "email"
    t.string "logradouro", default: "", null: false
    t.string "numero_log", default: "", null: false
    t.string "bairro", default: "", null: false
    t.string "cep", default: "", null: false
    t.string "site"
    t.uuid "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_fornecedors_on_city_id"
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

  create_table "parceiros", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome"
    t.string "telefome"
    t.string "cnpj"
    t.string "inscricao_estatual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.text "description"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projetos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "titulo"
    t.text "descricao"
    t.string "status"
    t.text "metas"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "telefone"
    t.string "rg"
    t.string "cpf"
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_responsibles_on_student_id"
  end

  create_table "setors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "descricao"
    t.string "permissao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_needs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "descricao"
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_special_needs_on_student_id"
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
    t.datetime "admission_date", default: "2017-11-14 17:19:57", null: false
    t.uuid "city_id"
    t.string "address_street", default: "", null: false
    t.string "address_number", default: "", null: false
    t.string "address_neighborhood", default: "", null: false
    t.string "address_zip_code", default: "", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "voluntarios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.date "data_nascimento"
    t.string "rg"
    t.string "cpf"
    t.string "telefone"
    t.string "usuario"
    t.string "senha"
    t.string "sexo"
    t.text "atuacao"
    t.string "status"
    t.string "address_street", default: "", null: false
    t.string "address_number", default: "", null: false
    t.string "address_neighborhood", default: "", null: false
    t.string "address_zip_code", default: "", null: false
    t.uuid "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_voluntarios_on_city_id"
  end

  add_foreign_key "abastecimentos", "fleets", column: "fleets_id"
  add_foreign_key "action_plans", "students"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "students"
  add_foreign_key "appointments", "students"
  add_foreign_key "cities", "states"
  add_foreign_key "colaboradors", "cities"
  add_foreign_key "conta_a_recebers", "doacaos"
  add_foreign_key "doacaos", "parceiros"
  add_foreign_key "fleets", "users", column: "driver_id"
  add_foreign_key "food_restrictions", "students"
  add_foreign_key "fornecedors", "cities"
  add_foreign_key "medicines", "students"
  add_foreign_key "partner_donations", "partners"
  add_foreign_key "partners", "cities"
  add_foreign_key "responsibles", "students"
  add_foreign_key "special_needs", "students"
  add_foreign_key "student_appointments", "students"
  add_foreign_key "student_appointments", "users"
  add_foreign_key "students", "cities"
  add_foreign_key "students", "fleets"
  add_foreign_key "supplies", "fleets"
  add_foreign_key "users", "cities"
  add_foreign_key "voluntarios", "cities"
end
