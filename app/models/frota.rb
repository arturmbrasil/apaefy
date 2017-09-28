class Frota < ApplicationRecord

	#Campos obrigatórios
	validates_presence_of :nome
    validates_presence_of :veiculo
    validates_presence_of :placa
    validates_presence_of :renavam
    validates_presence_of :chassi
    validates_presence_of :rota
    validates_presence_of :motorista
    validates_presence_of :roteirista

    #Cada campo tem que ter exatamente o número de caracteres corretos
 	validates_length_of :placa, is: 7
 	validates_length_of :renavam, is: 11
 	validates_length_of :chassi, is: 17

 	#Não pode repetir um nome que já esta no banco
 	validates_uniqueness_of :nome

 	#Deve ser numérico
 	validates_numericality_of :renavam

end
