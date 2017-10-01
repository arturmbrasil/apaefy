class Responsible < ApplicationRecord
  belongs_to :student

  validates :nome, presence: true
  validates :data_nascimento, presence: true
  validates :rg, presence: true
  validates :cpf, presence: true
end
