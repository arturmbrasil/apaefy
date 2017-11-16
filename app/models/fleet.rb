# frozen_string_literal: true

class Fleet < ApplicationRecord
  belongs_to :driver, -> { where(role: :driver) }, class_name: 'User'
  has_many :students, dependent: :nullify

  validates :name, presence: true
  validates :vehicle, presence: true
  validates :license_plate, presence: true
  validates :document_renavam, presence: true
  validates :chassis, presence: true
  validates :starting_address, presence: false
  validates :destination_address, presence: false

  def self.to_csv(options = {})
    @fleets = Fleet.includes(:driver, students: [city: [:state]])

    desired_columns = [
      'id',
      'name',
      'driver',
      'vehicle',
      'starting_address',
      'destination_address',
      'route',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      @fleets.find_each do |fleet|
        row = desired_columns.map do |col|
          value = fleet.attributes.values_at(col)
          case col
          when 'driver'
            fleet.driver ? [fleet.driver.name] : []
          when 'route'
            fleet.students ? [fleet.students.map(&:full_address).join(' - ')] : []
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
