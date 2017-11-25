class Loan < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :user, optional: true

  has_many :loan_products, dependent: :destroy
  has_many :products, through: :loan_products

  validates :student_id, presence: false, allow_nil: true
  validates :user_id, presence: false, allow_nil: true
end
