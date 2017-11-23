class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :value, presence: true
  validates :stock, presence: true

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
    num_or_conditions = 1
    where(
      terms.map do
        or_clauses = [
          'LOWER(products.name) LIKE ?',
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
      order("products.created_at #{direction}")
    when /^name_/
      order("LOWER(products.name) #{direction}")
    when /^value_/
      order("products.value #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Valor (Crescente)', 'value_asc'],
      ['Valor (Decrescente)', 'value_desc'],
      ['Mais novos', 'created_at_desc'],
      ['Mais antigos', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })

    desired_columns = [
      'name',
      'description',
      'value',
      'stock',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |product|
        row = desired_columns.map do |col|
          value = product.attributes.values_at(col)
        end

        csv << row.flatten
      end
    end
  end

end
