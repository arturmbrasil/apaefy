class Address < ApplicationRecord
  belongs_to :city
  belongs_to :student
  
  validates :logradouro, presence: true
  validates :cep, presence: true
  validates :bairro, presence: true
end
