# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'net/http'
require 'json'

rainy_id = 1
snowy_id = 2
sunny_id = 3

puts "Destroying songs"

Song.destroy_all

puts "Creating songs"

24.times do |hour|
    Song.create(
    hour: hour,
    weather: "Rainy",
    url: "https://acnhapi.com/v1/hourly/#{rainy_id}")

    hour += 1
    rainy_id +=3
end

24.times do |hour|
    Song.create(
    hour: hour,
    weather: "Snowy",
    url: "https://acnhapi.com/v1/hourly/#{snowy_id}")

    hour += 1
    snowy_id +=3
end

24.times do |hour|
    Song.create(
    hour: hour,
    weather: "Sunny",
    url: "https://acnhapi.com/v1/hourly/#{sunny_id}")

    hour += 1
    sunny_id +=3
end


# puts "Destroying all critters"
# Critter.destroy_all

# puts "Creating fish"

# 80.times do |id|
#     id +=1 

#     url = "http://acnhapi.com/v1/fish/#{id}"
#     uri = URI.parse(url)
#     response = Net::HTTP.get_response(uri)
#     fishJson = JSON.parse(response.body)

#     Critter.create(category: "fish", game_id: fishJson["id"], name: fishJson["name"]["name-USen"], img_url: fishJson["icon_uri"], 
#     nh_available_months: fishJson["availability"]["month-array-northern"],
#     sh_available_months: fishJson["availability"]["month-array-southern"],
#     available_times: fishJson["availability"]["time-array"])

#     id+=1
# end

# puts "Creating bugs"

# 80.times do |id|
#     id +=1 

#     url = "http://acnhapi.com/v1/bugs/#{id}"
#     uri = URI.parse(url)
#     response = Net::HTTP.get_response(uri)
#     bugJson = JSON.parse(response.body)

#     Critter.create(category: "bug", game_id: bugJson["id"], name: bugJson["name"]["name-USen"], img_url: bugJson["icon_uri"],
#     nh_available_months: bugJson["availability"]["month-array-northern"],
#     sh_available_months: bugJson["availability"]["month-array-southern"],
#     available_times: bugJson["availability"]["time-array"])

#     id+=1
# end

# puts "Creating sea creatures"

# 40.times do |id|
#     id +=1 

#     url = "http://acnhapi.com/v1/sea/#{id}"
#     uri = URI.parse(url)
#     response = Net::HTTP.get_response(uri)
#     seaJson = JSON.parse(response.body)

#     Critter.create(category: "sea_creature", game_id: seaJson["id"], name: seaJson["name"]["name-USen"], img_url: seaJson["icon_uri"],
#     nh_available_months: seaJson["availability"]["month-array-northern"],
#     sh_available_months: seaJson["availability"]["month-array-southern"],
#     available_times: seaJson["availability"]["time-array"])

#     id+=1
# end

