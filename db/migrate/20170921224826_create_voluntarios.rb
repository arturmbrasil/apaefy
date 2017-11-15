class CreateVoluntarios < ActiveRecord::Migration[5.1]
  def change
    create_table :voluntarios, id: :uuid do |t|
      t.integer :codigo
      t.string :nome
      t.date :data_nascimento
      t.string :rg
      t.string :cpf
      t.string :telefone
      t.string :usuario
      t.string :senha
      t.string :sexo
      t.text :atuacao
      t.string :status
      t.string :address_street, null: false, default: ''
      t.string :address_number, null: false, default: ''
      t.string :address_neighborhood, null: false, default: ''
      t.string :address_zip_code, null: false, default: ''
      t.references :city, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
