class CreateFoodRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :food_restrictions, id: :uuid do |t|
      t.string :restriction
      t.references :student, foreign_key: true, type: :uuid, index: true

      t.timestamps
    end
  end
end
