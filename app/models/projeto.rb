class Projeto < ApplicationRecord
    validates :titulo, :descricao, :status, :metas, :valor, presence: true

    def save
        if self.codigo.blank?
            codigo = ActiveRecord::Base.connection.execute("select coalesce(max(codigo),0) nextcd from projetos")
            if codigo.present?
                self.codigo = codigo[0]["nextcd"] + 1
            end 
        end
        super
    end
end
