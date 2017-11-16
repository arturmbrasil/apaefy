# frozen_string_literal: true

class Student < ApplicationRecord
  enum gender: { male: 'M', female: 'F' }

  has_many :medicines, dependent: :destroy
  has_many :appointments, class_name: 'StudentAppointment', dependent: :destroy
  belongs_to :city, optional: true
  belongs_to :fleet, optional: true

  delegate :state, to: :city, allow_nil: true
  delegate :state_id, to: :city, allow_nil: true

  validates :name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :document_cpf, cpf: true, allow_blank: true

  # Filtros
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
    )
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option.match?(/desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("students.created_at #{direction}")
    when /^name_/
      order("LOWER(students.name) #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Data de cadastro (novos)', 'created_at_desc'],
      ['Data de cadastro (antigos)', 'created_at_asc']
    ]
  end

  def full_address
    "#{address_street}, nº #{address_number}, #{city.name}-#{state.acronym}"
  end
end
