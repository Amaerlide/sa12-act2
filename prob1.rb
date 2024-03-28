require 'httparty'

user = 'Amaerlide'

response = HTTParty.get("https://api.github.com/users/#{user}/repos")

if response.success?
  repos = response

  highest_star = repos.max_by {|repo| repo['stargazers_count']}

  puts "Name: #{highest_star["name"]}"
  puts "Description: #{highest_star["description"]}"
  puts "Stars: #{highest_star["stargazers_count"]}"
  puts "Forks: #{highest_star["forks_count"]}"
  puts "URL: #{highest_star["html_url"]}"

else
  puts "Failed to fetch repos: #{response.code}"
end
