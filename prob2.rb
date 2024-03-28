require 'httparty'

response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")

if response.success?

  currency = response

  srted_curr = currency.sort_by {|item| -item['market_cap']}.take(5)

  srted_curr.each do |item|
    puts "Name: #{item['name']}"
    puts "Current Price: #{item['current_price']}"
    puts "Market Cap: #{item['market_cap']}\n\n"

  end

else
  puts "Failed to fetch repos: #{response.code}"
end
