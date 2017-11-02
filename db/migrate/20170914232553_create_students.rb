class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: :uuid do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :rg_aluno
      t.string :cpf_aluno
      t.string :telefone
      t.string :sexo
      t.references :frota, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
