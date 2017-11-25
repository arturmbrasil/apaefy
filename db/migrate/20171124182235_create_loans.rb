class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans, id: :uuid do |t|
      t.references :student, foreign_key: true, type: :uuid, index: true
      t.references :user, foreign_key: true, type: :uuid, index: true
      t.date :loan_date, null: false
      t.date :return_date, null: false

      t.timestamps
    end
  end
end
