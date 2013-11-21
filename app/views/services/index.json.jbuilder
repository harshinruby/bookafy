json.array!(@services) do |service|
  json.extract! service, :service_name, :price, :description
  json.url service_url(service, format: :json)
end
