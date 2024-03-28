require 'httparty'


area = 'Europe'
location = 'London'

response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")

if response.success?

  loc_date_time = response

  date = /\d{4}-\d{2}-\d{2}/.match(loc_date_time['datetime'])[0]
  time = /\d{2}:\d{2}:\d{2}/.match(loc_date_time['datetime'])[0]

  puts "The current time in #{loc_date_time['timezone']} is #{date} #{time}"



else
  puts "Failed to fetch repos: #{response.code}"
end
