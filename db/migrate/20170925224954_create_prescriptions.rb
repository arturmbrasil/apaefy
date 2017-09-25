class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions, id: :uuid do |t|
      t.string :dosage, null: false
      t.string :time_interval, null: false
      t.references :student, type: :uuid, null: false, foreign_key: true
      t.references :medicine, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
