class Funcionario < ApplicationRecord
  belongs_to :setor

  validates :nome, :telefone, :rg, :cpf, :cns, :cnh, :ctps, :data_nascimento, :data_admissao, :sexo, :status, :usuario, :senha, presence:true

  def destroy
    self.status = "N"
    self.save
  end

  def save
      if self.codigo.blank?
          codigo = ActiveRecord::Base.connection.execute("select coalesce(max(codigo),0) nextcd from funcionarios")
          if codigo.present?
              self.codigo = codigo[0]["nextcd"] + 1
          end 
      end
      if self.status.present? and !self.codigo.eql? "N"
        self.status = "N"
      elsif self.status.present? and self.codigo.eql? "N"
        self.status = "N"
      else 
        self.status = "S"
      end
      super
  end
end
