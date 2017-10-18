class CreateFuncionarios < ActiveRecord::Migration[5.1]
  def change
    create_table :funcionarios, id: :uuid do |t|
      t.integer :codigo
      t.string :nome
      t.date :data_nascimento
      t.string :rg
      t.string :cpf
      t.string :usuario
      t.string :senha
      t.string :sexo
      t.date :data_admissao
      t.string :ctps
      t.integer :cnh
      t.string :cns
      t.string :status
      t.timestamps
    end
  end
end
