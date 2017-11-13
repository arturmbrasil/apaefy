class Student < ApplicationRecord
  enum gender: { male: 'M', female: 'F' }

  belongs_to :city, optional: true
  delegate :state_id, to: :city, allow_nil: true

  validates :name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :document_cpf, cpf: true, allow_blank: true
end
