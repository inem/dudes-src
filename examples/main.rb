require_relative 'lib/thing'
require_relative 'lib/thing_collection'

things = ThingCollection.from_dir("#{__dir__}/data")

puts 'Сколько градусов за окном? (можно с минусом)'
temp = gets.to_i

puts things.message(temp)
puts things.weather_clothing(temp)

