class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students, id: :uuid do |t|
      t.boolean :active, null: false, default: true
      t.string :name, null: false
      t.date :birthday, null: false
      t.string :document_rg, null: false, default: ''
      t.string :document_cpf, null: false, default: ''
      t.string :phone_numbers, array: true, default: []
      t.string :gender, limit: 1, null: false
      t.integer :cns

      t.timestamps
    end
  end
end
