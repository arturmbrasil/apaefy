class Abastecimento < ApplicationRecord

	#Campos obrigatórios
	validates_presence_of :combustivel
	validates_presence_of :litros
	validates_presence_of :valor
	validates_presence_of :data_abastecimento

  	belongs_to :frota
end
