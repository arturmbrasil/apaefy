class Colaborador < ApplicationRecord
    validates :nome, :data_nascimento, :rg, :cpf, :telefone, :sexo, :inscricao_estadual, presence: true
end
