class Appointment < ApplicationRecord
  belongs_to :student

  validates_presence_of :data
  validates_presence_of :horario
  validates_presence_of :descricao
end
