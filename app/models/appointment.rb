class Appointment < ApplicationRecord
  belongs_to :student

  validates :data, presence: true
  validates :horario, presence: true
  validates :descricao, presence: true
  validates :student, presence: true
end
