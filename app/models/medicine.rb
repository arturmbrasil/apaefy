class Medicine < ApplicationRecord
  has_many :prescriptions, inverse_of: :medicine, dependent: :destroy

  accepts_nested_attributes_for :prescriptions, reject_if: :all_blank, allow_destroy: true

  validates :nome, presence: true
end
