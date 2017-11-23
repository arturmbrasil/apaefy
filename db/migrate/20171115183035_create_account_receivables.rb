class CreateAccountReceivables < ActiveRecord::Migration[5.1]
  def change
    create_table :account_receivables, id: :uuid do |t|
      t.date :date
      t.string :name
      t.decimal :value
      t.string :num_parcela
      # t.references :partner_donations, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
