class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments, id: :uuid do |t|
      t.date :data
      t.time :horario
      t.references :student, type: :uuid, foreign_key: true, index: true
      t.references :funcionario, type: :uuid, foreign_key: true, index: true
      t.string :descricao

      t.timestamps
    end
  end
end
