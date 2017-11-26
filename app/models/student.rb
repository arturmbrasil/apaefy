# frozen_string_literal: true

require 'csv'

class Student < ApplicationRecord
  enum gender: { male: 'M', female: 'F' }

  has_many :medicines, dependent: :destroy
  has_many :dietary_restrictions, dependent: :destroy
  has_many :student_responsibles, dependent: :destroy
  has_many :appointments, class_name: 'StudentAppointment', dependent: :destroy
  has_many :student_evolutions, dependent: :destroy
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
      sorted_by_restriction
      sorted_by_use_meds
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
    direction = sort_option.match(/desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("students.created_at #{direction}")
    when /^name_/
      order("LOWER(students.name) #{direction}")
    when /^birthday_/
      order("students.birthday #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

   scope :sorted_by_restriction, lambda { |sort_option|
    if sort_option.eql? 'Y'
        where('EXISTS (SELECT 1 FROM dietary_restrictions WHERE student_id = students.id)')
    end
   }

   scope :sorted_by_use_meds, lambda { |sort_option| 
    if sort_option.eql? 'Y'
      where('EXISTS (SELECT 1 FROM medicines WHERE student_id = students.id)')
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome (a-z)', 'name_asc'],
      ['Data de cadastro (novos)', 'created_at_desc'],
      ['Data de cadastro (antigos)', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1'})
    desired_columns = ['id', 'name', 'gender', 'birthday', 'document_cpf', 'document_rg', 'phone_numbers', 'created_at']
    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |student|
        row = desired_columns.map do |col|
          value = student.attributes.values_at(col)
          if col == 'gender'
            [self.human_attribute_name("gender.#{value.first}")]
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end

  def self.options_for_yes_no
    [
      ['Sim', 'Y'],
      ['Não', 'N']
    ]
  end

  def full_address
    "#{address_street}, nº #{address_number}, #{city.name}-#{state.acronym}"
  end
end
