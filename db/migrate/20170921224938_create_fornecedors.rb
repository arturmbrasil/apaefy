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
      t.string :logradouro, null: false, default: ''
      t.string :numero_log, null: false, default: ''
      t.string :bairro, null: false, default: ''
      t.string :cep, null: false, default: ''
      t.string :site
      t.references :city, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
