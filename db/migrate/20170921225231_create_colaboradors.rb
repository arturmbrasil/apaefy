class CreateColaboradors < ActiveRecord::Migration[5.1]
  def change
    create_table :colaboradors, id: :uuid do |t|
      t.integer :codigo
      t.string :nome
      t.date :data_nascimento
      t.string :rg
      t.string :cpf
      t.string :telefone
      t.string :sexo
      t.string :cnpj
      t.string :inscricao_estadual
      t.references :city, foreign_key: true, type: :uuid
      t.string :address_street, null: false, default: ''
      t.string :address_number, null: false, default: ''
      t.string :address_neighborhood, null: false, default: ''
      t.string :address_zip_code, null: false, default: ''
      t.timestamps
    end
  end
end
