class CreateFoodRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :food_restrictions, id: :uuid do |t|
      t.string :restricao

      t.timestamps
    end
  end
end
