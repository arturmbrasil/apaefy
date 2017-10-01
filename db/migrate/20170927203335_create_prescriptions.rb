class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions, id: :uuid do |t|
      t.references :student, type: :uuid, index: true, foreign_key: true
      t.references :medicine, type: :uuid, index: true, foreign_key: true
      t.string :dosagem
      t.string :intervalo_tempo

      t.timestamps
    end
  end
end
