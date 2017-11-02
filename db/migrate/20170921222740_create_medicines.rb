class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: :uuid do |t|
      t.string :nome
      t.string :dosagem
      t.string :intervalo_tempo
      t.references :student, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
