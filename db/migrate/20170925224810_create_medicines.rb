class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: :uuid do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
