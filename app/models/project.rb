class Project < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :goals, presence: true
  validates :value, presence: true
end
