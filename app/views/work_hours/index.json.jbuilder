json.array!(@work_hours) do |work_hour|
  json.extract! work_hour, :day, :start_time, :end_time
  json.url work_hour_url(work_hour, format: :json)
end
