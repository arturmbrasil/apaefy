class Fornecedor < ApplicationRecord
    validates :nome, :telefone, :cnpj, :inscricao_estadual, presence: true
end
