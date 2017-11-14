class CreateAbastecimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :abastecimentos, id: :uuid do |t|
      t.string :combustivel
      t.references :fleets, foreign_key: true, type: :uuid, index: true
      t.float :litros
      t.float :valor
      t.date :data_abastecimento

      t.timestamps
    end
  end
end
