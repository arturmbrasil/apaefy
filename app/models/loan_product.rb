class LoanProduct < ApplicationRecord
  belongs_to :product
  belongs_to :loan
end
