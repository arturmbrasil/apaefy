class CreateDietaryRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :dietary_restrictions, id: :uuid do |t|
      t.string :restriction, null: false
      t.references :student, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
