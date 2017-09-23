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

      t.timestamps
    end
  end
end
