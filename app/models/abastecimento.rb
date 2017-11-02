class Abastecimento < ApplicationRecord

	#Campos obrigatórios
	validates :combustivel, presence: true
	validates :litros, presence: true
	validates :valor, presence: true
	validates :data_abastecimento, presence: true

  belongs_to :frota
end
