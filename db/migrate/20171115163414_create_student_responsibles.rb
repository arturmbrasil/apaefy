class CreateStudentResponsibles < ActiveRecord::Migration[5.1]
  def change
    create_table :student_responsibles, id: :uuid do |t|
      t.string :name, null: false
      t.date :birth_date, null: false
      t.string :phone_number, null: false, default: ''
      t.string :responsible_rg, null: false
      t.string :responsible_cpf, null: false
      t.string :gender, null: false
      t.references :student, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
