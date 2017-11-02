class CreateContaAPagars < ActiveRecord::Migration[5.1]
  def change
    create_table :conta_a_pagars, id: :uuid do |t|
      t.date :dt_vencimento
      t.string :nome
      t.integer :nr_nota
      t.float :valor

      t.timestamps
    end
  end
end
