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
      t.timestamps
    end
  end
end
