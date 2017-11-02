class CreateFornecedors < ActiveRecord::Migration[5.1]
  def change
    create_table :fornecedors, id: :uuid do |t|
      t.integer :codigo
      t.string :nome
      t.string :telefone
      t.string :cnpj
      t.string :inscricao_estadual
      t.text :centro_custo
      t.string :email
      t.string :logradouro
      t.string :numero_log
      t.string :bairro
      t.string :site
      t.timestamps
    end
  end
end
