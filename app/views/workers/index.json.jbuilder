json.array!(@workers) do |worker|
  json.extract! worker, :alias
  json.url worker_url(worker, format: :json)
end
