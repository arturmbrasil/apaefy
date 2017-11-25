# frozen_string_literal: true

class Fleet < ApplicationRecord
  belongs_to :driver, -> { where(role: :driver) }, class_name: 'User'
  has_many :students, dependent: :nullify

  validates :name, presence: true
  validates :vehicle, presence: true
  validates :license_plate, presence: true
  validates :document_renavam, presence: true
  validates :chassis, presence: true
  validates :starting_address, presence: false
  validates :destination_address, presence: false

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
          'LOWER(fleets.name) LIKE ?'
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
      order("fleets.created_at #{direction}")
    when /^name_/
      order("LOWER(fleets.name) #{direction}")
    when /^driver_/
      order("fleets.driver.name #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nome da Frota (a-z)', 'name_asc'],
      ['Nome do Motorista (a-z)', 'driver_asc'],
      ['Mais novos', 'created_at_desc'],
      ['Mais antigos', 'created_at_asc']
    ]
  end

  def self.to_csv(options = { col_sep: ';', encoding: 'ISO-8859-1' })
    @fleets = Fleet.includes(:driver, students: [city: [:state]])

     desired_columns = [
      'name',
      'driver',
      'vehicle',
      'license_plate',
      'document_renavam',
      'chassis',
      'starting_address',
      'destination_address',
      'route',
      'created_at'
    ]

    CSV.generate(options) do |csv|
      csv << desired_columns.map { |column| self.human_attribute_name column }
      self.find_each do |fleet|
        row = desired_columns.map do |col|
          value = fleet.attributes.values_at(col)
          case col
          when 'driver'
            fleet.driver ? [fleet.driver.name] : []
          when 'route'
            fleet.students ? [fleet.students.map(&:full_address).join(' - ')] : []
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
