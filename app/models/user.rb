class User < ApplicationRecord
  enum gender: { male: 'M', female: 'F' }
  enum role: { finance: 'FIN', director: 'DIR', teacher: 'TEA', technician: 'TEC', doctor: 'DOC' }

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :gender, presence: true
  validates :role, presence: true
  validates :birthday, presence: true
  validates :document_rg, presence: true
  validates :document_cpf, presence: true
  validates :document_cnh, presence: true
  validates :document_cns, presence: true
  validates :admission_date, presence: true
end
