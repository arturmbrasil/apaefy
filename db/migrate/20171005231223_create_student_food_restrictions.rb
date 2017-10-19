class CreateStudentFoodRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :student_food_restrictions, id: :uuid do |t|
      t.references :student, type: :uuid, foreign_key: true
      t.references :food_restriction, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
