class CreateFornecedors < ActiveRecord::Migration[5.1]
  def change
    create_table :fornecedors, id: :uuid do |t|
      t.integer :codigo
      t.string :nome
      t.string :telefone
      t.string :cnpj
      t.string :inscricao_estadual

      t.timestamps
    end
  end
end
