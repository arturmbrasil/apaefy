class ChangeUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :name, null: false
      t.string :gender, limit: 1, null: false
      t.date :birthday, null: false
      t.string :phone_numbers, array: true, default: []
      t.string :document_rg, null: false
      t.string :document_cpf, null: false
      t.datetime :admission_date, null: false, default: 'now'
    end
  end
end
