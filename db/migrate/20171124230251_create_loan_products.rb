class CreateLoanProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_products, id: :uuid do |t|
      t.references :product, foreign_key: true, type: :uuid, index: true
      t.references :loan, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
