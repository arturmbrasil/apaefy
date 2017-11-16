class User < ApplicationRecord
  enum gender: { male: 'M', female: 'F' }
  enum role: { finance: 'FIN', director: 'DIR', teacher: 'TEA', technician: 'TEC', doctor: 'DOC', driver: 'DRI' }

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :city, optional: true
  has_many :student_appointments, dependent: :destroy
  delegate :state_id, to: :city, allow_nil: true
  delegate :state, to: :city, allow_nil: true

  validates :name, presence: true
  validates :gender, presence: true
  validates :role, presence: true
  validates :birthday, presence: true
  validates :document_rg, presence: true
  validates :document_cpf, presence: true, cpf: true
  validates :document_cnh, presence: true
  validates :document_cns, presence: true
  validates :admission_date, presence: true

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: %i[
      sorted_by
      search_query
      sorted_by_role
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
          'LOWER(users.name) LIKE ?',
          'users.document_cpf LIKE ?'
        ].join(' OR ')
        "(#{or_clauses})"
      end.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option.match?(/desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("users.created_at #{direction}")
    when /^name_/
      order("LOWER(users.name) #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  scope :sorted_by_role, lambda { |sort_option|
    where(role: sort_option.to_sym)
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Data de cadastro (novos)', 'created_at_desc'],
      ['Data de cadastro (antigos)', 'created_at_asc']
    ]
  end

  def self.options_for_sorted_by_role
    User.roles.map do |g|
      [User.human_attribute_name("role.#{g.first}"), g.last]
    end
  end
end
