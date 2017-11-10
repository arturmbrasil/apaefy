class State < ApplicationRecord
  has_many :cities

  validates :name, presence: true
  validates :acronym, presence: true
end
