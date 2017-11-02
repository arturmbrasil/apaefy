class Responsible < ApplicationRecord
  belongs_to :student

  validates_presence_of :nome
  validates_presence_of :data_nascimento
  validates_length_of :telefone, is: 10
  validates_length_of :rg, is: 7
  validates_length_of :cpf, is: 11
end
