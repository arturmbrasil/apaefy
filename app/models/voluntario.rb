class Voluntario < ApplicationRecord
    attr_accessor :order, :data_inicial, :data_final

    validates :nome, :data_nascimento, :rg, :cpf, :telefone, :sexo, :usuario, :senha, presence: true

    enum sexos: { masculino: 'M', feminino: 'F' }

    belongs_to :city, optional: true
    delegate :state_id, to: :city, allow_nil: true
    delegate :state, to: :city, allow_nil: true

    def relatorio
        Voluntario.where(created_at: data_inicial..data_final).order(order)
    end

    def destroy
        self.status = 'N'
        self.update
    end
    
end
