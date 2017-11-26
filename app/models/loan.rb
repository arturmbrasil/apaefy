class Loan < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :user, optional: true

  has_many :loan_products, dependent: :destroy
  has_many :products, through: :loan_products

  validates :student_id, presence: false, allow_nil: true
  validates :user_id, presence: false, allow_nil: true
  validate :valid_return_date
  validate :student_or_user_selected

  def valid_return_date
    if return_date < loan_date
      errors.add(:return_date, 'não pode ser anterior à data do empréstimo!')
    end
  end

  def student_or_user_selected
    unless student || user
      errors.add(:base, 'Selecione um aluno ou funcionário!')
    end
  end
end
