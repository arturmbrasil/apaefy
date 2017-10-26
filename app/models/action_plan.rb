class ActionPlan < ApplicationRecord
  belongs_to :student

  validates :data, presence: true
  validates :evolucao, presence: true
end
