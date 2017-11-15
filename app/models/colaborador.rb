class Colaborador < ApplicationRecord

    enum sexos: { masculino: 'M', feminino: 'F' }

    validates :nome, :data_nascimento, :rg, :cpf, :telefone, :sexo, :inscricao_estadual, presence: true

    belongs_to :city, optional: true
    delegate :state_id, to: :city, allow_nil: true
    delegate :state, to: :city, allow_nil: true

end
