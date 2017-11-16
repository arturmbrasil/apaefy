class Project < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :goals, presence: true
  validates :value, presence: true

  def self.to_csv(options = {})
    @projects = Project.includes(:user)

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
