class AccountPay < ApplicationRecord

  validates :value, presence: true
  validates :name, presence: true
  validates :date, presence: true

  def self.to_csv(options = {})
    @appointments = AccountReceivable

    desired_columns = [
        'name',
        'date',
        'value'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      @appointments.find_each do |appointment|
        row = desired_columns.map do |col|
          value = appointment.attributes.values_at(col)
        end
        csv << row.flatten
      end
    end
  end
end
