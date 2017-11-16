class Supply < ApplicationRecord
  belongs_to :fleet

  validates :fuel, presence: true
  validates :liters, presence: true
  validates :value, presence: true
  validates :supply_date, presence: true

  def self.to_csv(options = {})
    @supplies = Supply.includes(:fleet)

    desired_columns = [
      'id',
      'fleet',
      'fuel',
      'value',
      'supply_date',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      @supplies.find_each do |supply|
        row = desired_columns.map do |col|
          value = supply.attributes.values_at(col)
          case col
          when 'fleet'
            supply.fleet ? [supply.fleet.name] : ['']
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
