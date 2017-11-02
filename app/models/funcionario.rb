class Funcionario < ApplicationRecord
    validates :nome, :data_nascimento, :rg, :usuario, :senha, :sexo, :data_admissao, :cns, :cnh, :ctps, :status, presence: true

    def destroy
        self.status = 'N'
        self.save
    end
end
