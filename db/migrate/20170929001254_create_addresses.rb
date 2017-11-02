class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :logradouro
      t.integer :numero
      t.string :cep
      t.string :bairro
      t.references :city, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
