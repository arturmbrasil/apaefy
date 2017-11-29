class StudentEvolution < ApplicationRecord
  belongs_to :student

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
    num_or_conditions = 1
    where(
      terms.map do
        or_clauses = [
          'LOWER(students.name) LIKE ?'
        ].join(' OR ')
        "(#{or_clauses})"
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    ).joins(:student)
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option.match(/desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("student_evolutions.created_at #{direction}")
    when /^name_/
      order("students.name #{direction}").joins(:student)
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Nome (z-a)', 'name_desc'],
      ['Data de cadastro (novos)', 'created_at_desc'],
      ['Data de cadastro (antigos)', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1'})
    @student_evolution = StudentEvolution.includes(:student)
    desired_columns = [
      'id',
      'student',
      'date',
      'description',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |student_evolution|
        row = desired_columns.map do |col|
          value = student_evolution.attributes.values_at(col)
          case col
          when 'student'
            [student_evolution.student.name]
          when 'date'
            [value.first.strftime('%d/%m/%Y')]
          when 'created_at'
            [value.first.strftime('%d/%m/%Y')]
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
