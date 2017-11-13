
class AddAddressToStudents < ActiveRecord::Migration[5.1]
  def change
    change_table :students do |t|
      t.references :city, foreign_key: true, type: :uuid
      t.string :address_street, null: false, default: ''
      t.string :address_number, null: false, default: ''
      t.string :address_neighborhood, null: false, default: ''
      t.string :address_zip_code, null: false, default: ''
    end
  end
end
