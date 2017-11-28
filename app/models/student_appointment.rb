class StudentAppointment < ApplicationRecord
  belongs_to :student
  belongs_to :user

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
    )
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option.match(/desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("student_appointments.created_at #{direction}").joins(:student)
    when /^student_name_/
      order("LOWER(students.name) #{direction}").joins(:student)
    when /^user_name_/
      order("LOWER(users.name) #{direction}").joins(:user)
    when /^date_/
      order("date #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome do aluno (a-z)', 'student_name_asc'],
      ['Nome do funcionário (a-z)', 'user_name_asc'],
      ['Data de cadastro (novos)', 'created_at_desc'],
      ['Data de cadastro (antigos)', 'created_at_asc'],
      ['Data do agendamento (crescente)', 'date_asc'],
      ['Data do agendamento (decrescente)', 'date_desc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })
    @appointments = StudentAppointment.includes(:student, :user)

    desired_columns = [
      'id',
      'student',
      'user',
      'date',
      'time',
      'obs',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      @appointments.find_each do |appointment|
        row = desired_columns.map do |col|
          value = appointment.attributes.values_at(col)
          case col
          when 'user'
            appointment.user ? [appointment.user.name] : ['']
          when 'student'
            appointment.student ? [appointment.student.name] : ['']
          when 'date'
            [value.first.strftime('%d/%m/%Y')]
          when 'created_at'
            [value.first.strftime('%d/%m/%Y')]
          when 'time'
            [value.first.strftime('%H:%M')]
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
