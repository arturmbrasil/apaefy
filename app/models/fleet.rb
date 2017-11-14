class Fleet < ApplicationRecord
  belongs_to :driver, -> { where(role: :driver) }, class_name: 'User'
  has_many :students

  validates :name, presence: true
  validates :vehicle, presence: true
  validates :license_plate, presence: true
  validates :document_renavam, presence: true
  validates :chassis, presence: true
  validates :starting_address, presence: false
  validates :destination_address, presence: false
end
