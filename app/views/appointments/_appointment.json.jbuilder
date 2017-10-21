json.extract! appointment, :id, :data, :horario, :student_id, :descricao, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
