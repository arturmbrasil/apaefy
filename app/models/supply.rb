class Supply < ApplicationRecord
  belongs_to :fleet

  validates :fuel, presence: true
  validates :liters, presence: true
  validates :value, presence: true
  validates :supply_date, presence: true
end
