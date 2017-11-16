class CreateAccountPays < ActiveRecord::Migration[5.1]
  def change
    create_table :account_pays, id: :uuid do |t|
      t.string :name
      t.date :date
      t.integer :nr_nota
      t.decimal :value

      t.timestamps
    end
  end
end
