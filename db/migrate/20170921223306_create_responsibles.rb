class CreateResponsibles < ActiveRecord::Migration[5.1]
  def change
    create_table :responsibles, id: :uuid do |t|
      t.string :nome
      t.date :data_nascimento
      t.string :telefone
      t.string :rg
      t.string :cpf
      t.references :student, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
