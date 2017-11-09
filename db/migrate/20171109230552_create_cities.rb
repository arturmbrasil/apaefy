class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities, id: :uuid do |t|
      t.string :name
      t.references :state, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
