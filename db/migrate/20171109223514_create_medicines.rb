class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: :uuid do |t|
      t.string :name, null: false
      t.string :dosage, null: false
      t.string :time_interval, null: false
      t.references :student, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
