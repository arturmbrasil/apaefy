class Frota < ApplicationRecord

	#Campos obrigatórios
	validates :nome, presence: true, uniqueness: true
  validates :veiculo, presence: true
  validates :placa, presence: true, length: { is: 7 }
  validates :renavam, presence: true, length: {is: 11 }
  validates :chassi, presence: true, length: {is: 17 }
  validates :rota, presence: true
  validates :motorista, presence: true
  validates :roteirista, presence: true

end
