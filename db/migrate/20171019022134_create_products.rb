class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
