class CreateParceiros < ActiveRecord::Migration[5.1]
  def change
    create_table :parceiros, id: :uuid do |t|
      t.string :nome
      t.string :telefome
      t.string :cnpj
      t.string :inscricao_estatual

      t.timestamps
    end
  end
end
