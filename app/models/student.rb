class Student < ApplicationRecord
  has_many :prescriptions

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :rg, presence: true
  validates :gender, presence: true
end
