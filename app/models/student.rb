class Student < ApplicationRecord
  has_many :medicines, dependent: :destroy

  accepts_nested_attributes_for :medicines, reject_if: :all_blank, allow_destroy: true
end
