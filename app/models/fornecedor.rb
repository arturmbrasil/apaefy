class Fornecedor < ApplicationRecord
    validates :nome, :telefone, :cnpj, :inscricao_estadual, presence: true

    def save
        if self.codigo.blank?
            codigo = ActiveRecord::Base.connection.execute("select coalesce(max(codigo),0) nextcd from fornecedors")
            if codigo.present?
                self.codigo = codigo[0]["nextcd"] + 1
            end 
        end
        super
    end
end
