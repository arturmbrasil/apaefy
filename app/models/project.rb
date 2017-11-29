class Project < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :goals, presence: true
  validates :value, presence: true

  has_many :project_user, dependent: :destroy
  has_many :users, through: :project_user

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: %i[
      sorted_by
      search_query
      sorted_by_status
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
          'LOWER(projects.title) LIKE ?',
          'projects.status LIKE ?'
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
      order("projects.created_at #{direction}")
    when /^name_/
      order("LOWER(projects.name) #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Titulo (a-z)', 'title_asc'],
      ['Status', 'status_asc'],
      ['Valor', 'value_asc'],
      ['Mais novos', 'created_at_desc'],
      ['Mais antigos', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })
    @projects = self.includes(:user)

    desired_columns = [
      'id',
      'user',
      'title',
      'description',
      'status',
      'value',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      @projects.find_each do |project|
        row = desired_columns.map do |col|
          value = project.attributes.values_at(col)
          case col
          when 'user'
            project.user ? [project.user.name] : ['']
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
