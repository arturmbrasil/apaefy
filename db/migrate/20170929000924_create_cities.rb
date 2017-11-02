class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities, id: :uuid do |t|
      t.string :nome
      t.string :uf

      t.timestamps
    end
  end
end
