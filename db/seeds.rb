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

puts "Destroying all critters"
Critter.destroy_all

puts "Creating fish"

80.times do |id|
    id +=1 

    url = "http://acnhapi.com/v1/fish/#{id}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    fishJson = JSON.parse(response.body)

    Critter.create(category: "fish", name: fishJson["name"]["name-USen"], img_url: fishJson["icon_uri"])

    id+=1
end

puts "Creating bugs"

80.times do |id|
    id +=1 

    url = "http://acnhapi.com/v1/bugs/#{id}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    bugJson = JSON.parse(response.body)

    Critter.create(category: "bugs", name: bugJson["name"]["name-USen"], img_url: bugJson["icon_uri"])

    id+=1
end

puts "Creating sea creatures"

40.times do |id|
    id +=1 

    url = "http://acnhapi.com/v1/sea/#{id}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    seaJson = JSON.parse(response.body)

    Critter.create(category: "sea_creatures", name: seaJson["name"]["name-USen"], img_url: seaJson["icon_uri"])

    id+=1
end
