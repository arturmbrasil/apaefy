class Student < ApplicationRecord
  has_many :prescriptions, inverse_of: :student, dependent: :destroy
  has_many :responsibles, inverse_of: :student, dependent: :destroy
  has_many :food_restrictions, inverse_of: :student, dependent: :destroy
  has_many :special_needs, inverse_of: :student, dependent: :destroy

  accepts_nested_attributes_for :prescriptions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :responsibles, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :food_restrictions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :special_needs, reject_if: :all_blank, allow_destroy: true

  validates :nome, presence: true, length: { minimum: 3 }
  validates :data_nascimento, presence: true
  validates :rg_aluno, presence: true
  validates :sexo, presence: true
end
