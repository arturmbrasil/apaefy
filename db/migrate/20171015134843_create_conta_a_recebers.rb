class CreateContaARecebers < ActiveRecord::Migration[5.1]
  def change
    create_table :conta_a_recebers, id: :uuid do |t|
      t.date :data
      t.string :nome
      t.float :valor
      t.references :doacao, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
