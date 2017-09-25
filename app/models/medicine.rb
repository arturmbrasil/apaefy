class Medicine < ApplicationRecord
  has_many :prescriptions

  validates :name, presence: true
end
