class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners, id: :uuid do |t|
      t.string :name, null: false, default: ''
      t.string :phone_numbers, array: true, default: []
      t.string :document_cnpj, null: false, default: ''
      t.string :document_state_registration, null: false, default: ''
      t.string :email, null: false, default: ''

      t.references :city, foreign_key: true, type: :uuid
      t.string :address_street, null: false, default: ''
      t.string :address_number, null: false, default: ''
      t.string :address_neighborhood, null: false, default: ''
      t.string :address_zip_code, null: false, default: ''

      t.timestamps
    end
    add_index :partners, :email, unique: true
  end
end
