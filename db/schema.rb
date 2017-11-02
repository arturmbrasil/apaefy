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

ActiveRecord::Schema.define(version: 20171019223713) do
ActiveRecord::Schema.define(version: 20171029181749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "abastecimentos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "combustivel"
    t.uuid "frota_id"
    t.float "litros"
    t.float "valor"
    t.date "data_abastecimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frota_id"], name: "index_abastecimentos_on_frota_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
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
    t.string "nome"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "food_restrictions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "restriction"
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_food_restrictions_on_student_id"
  end

  create_table "frotas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome"
    t.string "veiculo"
    t.string "placa"
    t.bigint "renavam"
    t.string "chassi"
    t.string "rota"
    t.string "motorista"
    t.string "roteirista"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome"
    t.string "dosagem"
    t.string "intervalo_tempo"
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

  create_table "special_needs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "descricao"
    t.uuid "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_special_needs_on_student_id"
  end

  create_table "students", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome"
    t.date "data_nascimento"
    t.string "rg_aluno"
    t.string "cpf_aluno"
    t.string "telefone"
    t.string "sexo"
    t.string "restricoes_alimentares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.string "telefone"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.text "centro_custo"
    t.string "email"
    t.string "logradouro"
    t.string "numero_log"
    t.string "bairro"
    t.string "site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.date "data_nascimento"
    t.string "rg"
    t.string "cpf"
    t.string "sexo"
    t.string "data_admissao"
    t.string "ctps"
    t.integer "cnh"
    t.string "cns"
    t.string "status"
    t.string "telefone"
    t.string "usuario"
    t.string "senha"
    t.uuid "setor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setor_id"], name: "index_funcionarios_on_setor_id"
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

  create_table "setors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "codigo"
    t.string "descricao"
    t.string "permissao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "abastecimentos", "frotas"
  add_foreign_key "action_plans", "students"
  add_foreign_key "addresses", "cities"
  add_foreign_key "appointments", "students"
  add_foreign_key "conta_a_recebers", "doacaos"
  add_foreign_key "doacaos", "parceiros"
  add_foreign_key "food_restrictions", "students"
  add_foreign_key "medicines", "students"
  add_foreign_key "responsibles", "students"
  add_foreign_key "special_needs", "students"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "funcionarios", "setors"
end
