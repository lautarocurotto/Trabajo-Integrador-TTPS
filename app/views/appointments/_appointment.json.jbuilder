json.extract! appointment, :id, :date, :hour, :reason, :state, :attended_by_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
