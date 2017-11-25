class CreateStudentEvolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :student_evolutions, id: :uuid do |t|
      t.references :student, foreign_key: true, type: :uuid, index: true
      t.date :date, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
