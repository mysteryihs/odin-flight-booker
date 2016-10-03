# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport::delete_all
Flight::delete_all
sfo = Airport.create!(code: 'SFO')
lax = Airport.create!(code: 'LAX')
nyc = Airport.create!(code: 'NYC')
airports = [sfo, lax, nyc]

def random_date
	rand(30).days.from_now.strftime("%m/%d/%Y")
end

500.times do
	from = airports.sample
	to = airports.sample
	redo if from == to
	Flight.create!(from_airport: from, to_airport: to, duration: rand(1..10), date: random_date)
end