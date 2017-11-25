class Supply < ApplicationRecord
  belongs_to :fleet

  validates :fuel, presence: true
  validates :liters, presence: true
  validates :value, presence: true
  validates :supply_date, presence: true

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
          'LOWER(supplies.fuel) LIKE ?',
          'LOWER(supplies.fleet.name) LIKE ?',
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
      order("supplies.supply_date #{direction}")
    when /^name_/
      order("LOWER(supplies.name) #{direction}")
    when /^value_/
      order("supplies.value #{direction}")
    when /^fleet_/
      order("LOWER(supplies.fleet.name) #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Frota (a-z)', 'fleet_asc'],
      ['Valor (Crescente)', 'value_asc'],
      ['Valor (Decrescente)', 'value_desc'],
      ['Mais novos', 'created_at_desc'],
      ['Mais antigos', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })
    @supplies = self.includes(:fleet)

    desired_columns = [
      'fuel',
      'fleet',
      'liters',
      'value',
      'supply_date',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |supply|
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
