class CreateFleets < ActiveRecord::Migration[5.1]
  def change
    create_table :fleets, id: :uuid do |t|
      t.string :name, null: false
      t.string :vehicle, null: false
      t.string :license_plate, null: false
      t.string :document_renavam, null: false
      t.string :chassis, null: false
      t.string :route, null: false
      t.string :driver_name, null: false
      t.string :router, null: false

      t.timestamps
    end
  end
end
