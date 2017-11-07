class User < ApplicationRecord
  enum gender: { man: 'M', woman: 'W' }
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :document_rg, presence: true
  validates :document_cpf, presence: true
  validates :admission_date, presence: true
end
