class FoodRestriction < ApplicationRecord
  belongs_to :student

  validates :restriction, presence: true
end
