class Partner < ApplicationRecord
  belongs_to :city
  delegate :state_id, to: :city, allow_nil: true
  delegate :state, to: :city, allow_nil: true

  validates :name, presence: true
  validates :email, uniqueness: true, allow_blank: true
  validates :document_cnpj, presence: true, cnpj: true

  def full_address
    "#{address_street}, nº #{address_number}, #{city.name}-#{state.acronym}"
  end
end
