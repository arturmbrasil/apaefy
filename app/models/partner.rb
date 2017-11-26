class Partner < ApplicationRecord
  has_many :donations, class_name: 'PartnerDonation', dependent: :destroy

  belongs_to :city
  delegate :state_id, to: :city, allow_nil: true
  delegate :state, to: :city, allow_nil: true

  validates :name, presence: true
  validates :email, uniqueness: true, allow_blank: true
  validates :document_cnpj, presence: true, cnpj: true

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
          'LOWER(partners.name) LIKE ?',
          'partners.document_cnpj LIKE ?'
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
      order("partners.created_at #{direction}")
    when /^name_/
      order("LOWER(partners.name) #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Mais novos', 'created_at_desc'],
      ['Mais antigos', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })
  @partners = self.includes(city: [:state])

  desired_columns = [
    'id',
    'name',
    'phone_numbers',
    'document_cnpj',
    'document_state_registration',
    'email',
    'state',
    'city',
    'address_street',
    'address_number',
    'address_zip_code',
    'address_neighborhood',
    'created_at'
  ]

  CSV.generate(options) do |csv|
    csv << desired_columns.map { |column| self.human_attribute_name column }
    @partners.find_each do |partner|
      row = desired_columns.map do |col|
        value = partner.attributes.values_at(col)
        case col
        when 'city'
          partner.city ? [partner.city.name] : ['']
        when 'state'
          partner.city ? [partner.state.name] : ['']
        else
          value
        end
      end

      csv << row.flatten
    end
  end
end

  def full_address
    "#{address_street}, nº #{address_number}, #{city.name}-#{state.acronym}"
  end
end
