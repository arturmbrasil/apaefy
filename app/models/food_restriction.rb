class FoodRestriction < ApplicationRecord
  has_many :student_food_restrictions, inverse_of: :food_restriction, dependent: :destroy

  accepts_nested_attributes_for :student_food_restrictions, reject_if: :all_blank, allow_destroy: true

  validates :restricao, presence: true
end
