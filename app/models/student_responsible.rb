class StudentResponsible < ApplicationRecord
  belongs_to :student

  enum gender: { male: 'M', female: 'F' }

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true
  validates :responsible_rg, presence: true
  validates :responsible_cpf, presence: true
  validates :gender, presence: true
end
