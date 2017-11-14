class PartnerDonation < ApplicationRecord
  belongs_to :partner

  validates :value, presence: true
  validates :payment_type, presence: true
end
