class AccountReceivable < ApplicationRecord

  validates :value, presence: true
  validates :name, presence: true
  validates :date, presence: true

 filterrific(
    default_filter_params: { sorted_by: 'created_at_asc' },
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
          'LOWER(account_receivables.name) LIKE ?',
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
      order("account_receivables.date #{direction}")
    when /^name_/
      order("LOWER(account_receivables.name) #{direction}")
    when /^value_/
      order("account_receivables.value #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Valor (Crescente)', 'value_asc'],
      ['Valor (Decrescente)', 'value_desc'],
      ['Data de vencimento', 'created_at_asc'],
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })

    desired_columns = [
      'name',
      'date',
      'value',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |account_receivable|
        row = desired_columns.map do |col|
          value = account_receivable.attributes.values_at(col)
        end

        csv << row.flatten
      end
    end
  end
end
