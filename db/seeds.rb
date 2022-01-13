# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# "nickname", "ranking", "avatar"

require 'faker'
puts "seeds starting"

player1 = Player.create(nickname: Faker::Games::Zelda.character, ranking: rand(0..1000), status: "oro", avatar: "https://drive.google.com/thumbnail?id=1FvgHhPmYNwruvKSjok1dp-ikpKVD2O5z")
puts player1.nickname

puts "seeds ending"
