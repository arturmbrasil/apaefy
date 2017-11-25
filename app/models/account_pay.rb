class AccountPay < ApplicationRecord

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
          'LOWER(account_pays.name) LIKE ?',
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
      order("account_pays.date #{direction}")
    when /^name_/
      order("LOWER(account_pays.name) #{direction}")
    when /^value_/
      order("account_pays.value #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Valor (Crescente)', 'value_asc'],
      ['Valor (Decrescente)', 'value_desc'],
      ['Vencimento mais próximo', 'created_at_asc'],
      ['Vencimento mais longe', 'created_at_desc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })

    desired_columns = [
      'name',
      'date',
      'nr_nota',
      'value',
      'num_parcela',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |account_pay|
        row = desired_columns.map do |col|
          value = account_pay.attributes.values_at(col)
        end

        csv << row.flatten
      end
    end
  end
end
