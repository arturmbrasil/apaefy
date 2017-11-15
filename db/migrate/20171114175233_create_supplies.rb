class CreateSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies, id: :uuid do |t|
      t.string :fuel
      t.references :fleet, foreign_key: true, type: :uuid
      t.float :liters
      t.float :value
      t.date :supply_date

      t.timestamps
    end
  end
end
