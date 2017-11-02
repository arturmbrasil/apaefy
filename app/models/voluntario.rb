class Voluntario < ApplicationRecord
    validates :nome, :data_nascimento, :rg, :cpf, :telefone, :sexo, :usuario, :senha, presence: true
end
