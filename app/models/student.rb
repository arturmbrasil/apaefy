class Student < ApplicationRecord
  enum gender: { male: 'M', female: 'F' }

  validates :name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
end
