json.array!(@appointments) do |appointment|
  json.extract! appointment, :customer_name, :customer_mobile, :customer_email, :customer_requests
  json.url appointment_url(appointment, format: :json)
end
