class Fornecedor < ApplicationRecord
    attr_accessor :order
    validates :nome, :telefone, :cnpj, :inscricao_estadual, :numero_log, :logradouro, :bairro, :centro_custo, presence: true

    belongs_to :city, optional: true
    delegate :state_id, to: :city, allow_nil: true
    delegate :state, to: :city, allow_nil: true

    def relatorio
        Fornecedor.joins("JOIN cities c on city_id = c.id").where(city_id: city_id).order(order)
    end
end
