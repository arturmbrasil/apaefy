class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments, id: :uuid do |t|
      t.date :data
      t.integer :horario
      t.references :student, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
