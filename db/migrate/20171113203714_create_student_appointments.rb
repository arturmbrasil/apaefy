class CreateStudentAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :student_appointments, id: :uuid do |t|
      t.references :student, foreign_key: true, index: true, type: :uuid
      t.references :user, foreign_key: true, index: true, type: :uuid
      t.date :date, null: false
      t.time :time, null: false
      t.text :obs, null: false, default: ''

      t.timestamps
    end
  end
end
