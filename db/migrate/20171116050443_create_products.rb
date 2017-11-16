class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.float :value, null: false, default: ''
      t.string :stock, null: false, default: ''

      t.timestamps
    end
  end
end
