class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments, id: :uuid do |t|
      t.string :payment_type

      t.timestamps
    end
  end
end
