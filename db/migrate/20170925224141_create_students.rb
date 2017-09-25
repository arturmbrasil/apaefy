class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: :uuid do |t|
      t.string :name, null: false
      t.date   :birth_date, null: false
      t.string :rg, null: false
      t.string :phone
      t.string :cpf
      t.string :gender, null: false

      t.timestamps
    end
  end
end
