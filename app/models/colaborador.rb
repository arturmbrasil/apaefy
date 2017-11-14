class Colaborador < ApplicationRecord

    enum sexos: { masculino: 'M', feminino: 'F' }

    validates :nome, :data_nascimento, :rg, :cpf, :telefone, :sexo, :inscricao_estadual, presence: true

    def save
        if self.codigo.blank?
            codigo = ActiveRecord::Base.connection.execute("select coalesce(max(codigo),0) nextcd from colaboradors")
            if codigo.present?
                self.codigo = codigo[0]["nextcd"] + 1
            end 
        end
        super
    end

end
