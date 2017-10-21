class ActionPlan < ApplicationRecord
  belongs_to :student

  validates_presence_of :data
  validates_presence_of :evolucao
end
