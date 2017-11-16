class PartnerDonation < ApplicationRecord
  belongs_to :partner

  validates :value, presence: true
  validates :payment_type, presence: true

  def self.to_csv(options = {})
    @donations = PartnerDonation.includes(:partner)

    desired_columns = [
      'id',
      'partner',
      'value',
      'payment_type',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      @donations.find_each do |donation|
        row = desired_columns.map do |col|
          value = donation.attributes.values_at(col)
          case col
          when 'partner'
            donation.partner ? [donation.partner.name] : ['']
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
