class StudentAppointment < ApplicationRecord
  belongs_to :student
  belongs_to :user

  def self.to_csv(options = {})
    @appointments = StudentAppointment.includes(:user, :student)

    desired_columns = [
      'id',
      'user',
      'student',
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
          else
            value
          end
        end

        csv << row.flatten
      end
    end
  end
end
