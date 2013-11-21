json.array!(@customers) do |customer|
  json.extract! customer, :title, :first_name, :last_name, :address, :city, :state, :zip_code, :dob, :mobile, :email
  json.url customer_url(customer, format: :json)
end
