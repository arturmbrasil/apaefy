class Prescription < ApplicationRecord
  belongs_to :student
  belongs_to :medicine

  validates :dosage, presence: true
  validates :time_interval, presence: true
end
