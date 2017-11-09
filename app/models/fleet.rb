class Fleet < ApplicationRecord
  validates :name, presence: true
  validates :vehicle, presence: true
  validates :license_plate, presence: true
  validates :document_renavam, presence: true
  validates :chassis, presence: true
  validates :route, presence: true
  validates :driver_name, presence: true
  validates :router, presence: true
end
