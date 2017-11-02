class Address < ApplicationRecord
  belongs_to :city
  validates :logradouro, presence: true
  validates :cep, presence: true
  validates :bairro, presence: true
end
