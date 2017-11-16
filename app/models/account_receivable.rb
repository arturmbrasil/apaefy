class AccountReceivable < ApplicationRecord

  validates :value, presence: true
  validates :name, presence: true
  validates :date, presence: true
end
