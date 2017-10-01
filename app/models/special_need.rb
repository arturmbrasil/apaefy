class SpecialNeed < ApplicationRecord
  belongs_to :student

  validates :descricao, presence: true
end
