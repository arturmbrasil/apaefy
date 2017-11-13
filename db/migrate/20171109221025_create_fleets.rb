class CreateFleets < ActiveRecord::Migration[5.1]
  def change
    create_table :fleets, id: :uuid do |t|
      t.string :name, null: false
      t.string :vehicle, null: false
      t.string :license_plate, null: false
      t.string :document_renavam, null: false
      t.string :chassis, null: false
      t.string :starting_address, null: false
      t.string :destination_address, null: false

      t.references :driver, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
