# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Plan.create!(:name => "Never Been Kissed", :price => 5, :services => 3)
Plan.create!(:name => "Can't Get Enough", :price => 12, :services => 10)

WorkingDay.create!(day: 'Monday', status: true, start_time: "09:00", end_time: "17:00")
WorkingDay.create!(day: 'Tuesday', status: true, start_time: "09:00", end_time: "17:00")
WorkingDay.create!(day: 'Wednesday', status: true, start_time: "09:00", end_time: "17:00")
WorkingDay.create!(day: 'Thursday', status: true, start_time: "09:00", end_time: "17:00")
WorkingDay.create!(day: 'Friday', status: true, start_time: "09:00", end_time: "17:00")
WorkingDay.create!(day: 'Saturday', status: true, start_time: "09:00", end_time: "17:00")
WorkingDay.create!(day: 'Sunday', status: true, start_time: "09:00", end_time: "17:00")