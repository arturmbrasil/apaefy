class Loan < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :user, optional: true

  has_many :loan_products, dependent: :destroy
  has_many :products, through: :loan_products

  validates :student_id, presence: false, allow_nil: true
  validates :user_id, presence: false, allow_nil: true
  validate :valid_return_date
  validate :student_or_user_selected

  def valid_return_date
    if return_date < loan_date
      errors.add(:return_date, 'não pode ser anterior à data do empréstimo!')
    end
  end

  def student_or_user_selected
    unless student || user
      errors.add(:base, 'Selecione um aluno ou funcionário!')
    end
  end

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: %i[
      sorted_by
      search_query
    ]
  )

  scope :search_query, lambda { |query|
    return nil if query.blank?
    terms = query.downcase.split(/\s+/)
    terms = terms.map do |e|
      (e.tr('*', '%') + '%').gsub(/%+/, '%')
    end
    num_or_conditions = 2
    where(
      terms.map do
        or_clauses = [
          'LOWER(students.name) LIKE ?',
          'LOWER(users.name) LIKE ?'
        ].join(' OR ')
        "(#{or_clauses})"
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    ).joins(:student, :user)
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option.match(/desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("loans.created_at #{direction}")
    when /^loan_date_/
      order("loans.loan_date #{direction}")
    when /^return_date_/
      order("loans.return_date #{direction}")
    when /^user_/
      order("LOWER(users.name) #{direction}, LOWER(students.name) #{direction}").joins(:user, :student)
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Data de cadastro (novos)', 'created_at_desc'],
      ['Data de cadastro (antigos)', 'created_at_asc'],
      ['Data do empréstimo (novos)', 'loan_date_desc'],
      ['Data do empréstimo (antigos)', 'loan_date_asc'],
      ['Data de devolução (novos)', 'return_date_desc'],
      ['Data do devolução (antigos)', 'return_date_asc'],
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1'})
    @loan = Loan.includes(:student, :user, :product)
    desired_columns = [
      'id',
      'nome',
      'loan_date',
      'return_date',
      'produtos',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |loan|
        row = desired_columns.map do |col|
          value = loan.attributes.values_at(col)
          case col
          when 'nome'
            loan.student ? [loan.student.name] : [loan.user.name]
          when 'loan_date'
            [value.first.strftime('%d/%m/%Y')]
          when 'return_date'
            [value.first.strftime('%d/%m/%Y')]
          when 'created_at'
            [value.first.strftime('%d/%m/%Y')]
          when 'produtos'
            @produtos = ''
            loan.products.each do |prod|
              @produtos += prod.name
              if prod != loan.products.last
                @produtos += ', '
              end
            end
            [@produtos]
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
