class Projeto < ApplicationRecord
    validates :titulo, :descricao, :status, :metas, :valor, presence: true
end
