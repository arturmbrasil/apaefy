class Medicine < ApplicationRecord
  belongs_to :student

  validates :name, presence: true
  validates :dosage, presence: true
  validates :time_interval, presence: true
end
