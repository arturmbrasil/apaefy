class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: :uuid do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :rg_aluno
      t.string :cpf_aluno
      t.string :telefone
      t.string :sexo
      t.string :responsavel_curador
      t.string :restricoes_alimentares
      t.string :rg_responsavel
      t.string :cpf_responsavel

      t.timestamps
    end
  end
end
