class CreateStudentEvolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :student_evolutions, id: :uuid do |t|
      t.references :student, foreign_key: true
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
