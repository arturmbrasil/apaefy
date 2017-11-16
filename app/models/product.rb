class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :value, presence: true
  validates :stock, presence: true
end
