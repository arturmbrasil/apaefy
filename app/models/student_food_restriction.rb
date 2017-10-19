class StudentFoodRestriction < ApplicationRecord
  belongs_to :student
  belongs_to :food_restriction
end
