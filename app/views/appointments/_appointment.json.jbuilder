json.extract! appointment, :id, :date, :hour, :reason, :state, :attended_by, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
