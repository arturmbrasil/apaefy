class Prescription < ApplicationRecord
  belongs_to :student
  belongs_to :medicine
end
