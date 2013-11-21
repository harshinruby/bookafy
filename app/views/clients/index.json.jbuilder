json.array!(@clients) do |client|
  json.extract! client, :business_name, :business_type, :business_address
  json.url client_url(client, format: :json)
end
