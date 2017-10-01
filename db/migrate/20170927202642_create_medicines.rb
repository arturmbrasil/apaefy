class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: :uuid do |t|
      t.string :nome

      t.timestamps
    end
  end
end
