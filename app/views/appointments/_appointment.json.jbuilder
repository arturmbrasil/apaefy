json.extract! appointment, :id, :data, :horario, :descricao, :student_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
