class Responsible < ApplicationRecord
  belongs_to :student

  validates :nome, presence: true
  validates :data_nascimento, presence: true
  validates :telefone, length: { is: 10 }, allow_blank: true
  validates :rg, length: { is: 7 }, allow_blank: true
  validates :cpf, length: { is: 11 }, presence: true
end
