require 'csv'

class PartnerDonation < ApplicationRecord
  belongs_to :partner

  validates :value, presence: true
  validates :payment_type, presence: true

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: %i[
      sorted_by
      search_query
    ]
  )

  scope :search_query, lambda { |query|
    return nil if query.blank?
    terms = query.to_s.downcase.split(/\s+/)
    terms = terms.map do |e|
      (e.tr('*', '%') + '%').gsub(/%+/, '%')
    end
    num_or_conditions = 2
    where(
      terms.map do
        or_clauses = [
          'LOWER(partner_donations.payment_type) LIKE ?',
		  'partner_donations.partner_id IN (SELECT id from partners WHERE name LIKE ?)'
        ].join(' OR ')
        "(#{or_clauses})"
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option.match(/desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("partner_donations.created_at #{direction}")
	when /^value_/
	  order("partner_donations.value #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
	  ['Valor', 'value_desc'],
      ['Mais novos', 'created_at_desc'],
      ['Mais antigos', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })
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

  def get_partner_name
	if self.partner
		self.partner.name
	else
		'Sem Parceiro'
	end
  end

end
