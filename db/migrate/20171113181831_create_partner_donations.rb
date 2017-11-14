class CreatePartnerDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :partner_donations, id: :uuid do |t|
      t.float :value, null: false, default: 0
      t.string :payment_type, null: false, default: ''
      t.string :item, null: false, default: ''
      t.references :partner, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
