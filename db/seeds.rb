# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airline.destroy_all
Flight.destroy_all

airline1 = Airline.create(name: 'Alpha Air Lines', on_time: 'true', rating: 2)
airline2 = Airline.create(name: 'Conurbation Airlines', rating: 1)
airline3 = Airline.create(name: 'North East Airlines', on_time: 0, rating: 8)
airline4 = Airline.create(name: 'Divided Airlines',  rating: 7)
