class Appointment < ApplicationRecord
  belongs_to :student

  validates :data, presence: true
  validates :horario, presence: true
  validates :descricao, presence: true
end
