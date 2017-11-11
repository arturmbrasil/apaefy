class Appointment < ApplicationRecord
  belongs_to :student
  belongs_to :funcionario

  validates :data, presence: true
  validates :horario, presence: true
  validates :descricao, presence: true
end
