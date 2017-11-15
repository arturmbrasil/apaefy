class Projeto < ApplicationRecord
    attr_accessor :order, :data_inicial, :data_final
    validates :titulo, :descricao, :status, :metas, :valor, presence: true
    validates :valor, numericality: true

    def relatorio
        Projeto.where(created_at: data_inicial..data_final).order(order)
    end
end
