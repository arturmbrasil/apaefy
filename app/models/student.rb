class Student < ApplicationRecord
  enum gender: { male: 'M', female: 'F' }

  has_many :medicines, dependent: :destroy
  belongs_to :city, optional: true
  belongs_to :fleet, optional: true

  delegate :state, to: :city, allow_nil: true
  delegate :state_id, to: :city, allow_nil: true

  validates :name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :document_cpf, cpf: true, allow_blank: true

  def full_address
    "#{address_street}, nº #{address_number}, #{city.name}-#{state.acronym}"
  end
end
