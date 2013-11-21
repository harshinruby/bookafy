json.array!(@team_leaders) do |team_leader|
  json.extract! team_leader, :number_of_workers
  json.url team_leader_url(team_leader, format: :json)
end
