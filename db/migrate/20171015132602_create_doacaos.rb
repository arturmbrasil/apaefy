class CreateDoacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :doacaos, id: :uuid do |t|
      t.float :valor
      t.string :forma_pagamento
      t.references :parceiro, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
