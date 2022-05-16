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
airline4 = Airline.create(name: 'Divided Airlines', rating: 7)

flight11 = airline1.flights.create(destination: 'Miami', flight_number: 11, nonstop: true)
flight12 = airline1.flights.create(destination: 'New York', flight_number: 12, nonstop: false)
flight13 = airline1.flights.create(destination: 'Atlanta', flight_number: 13, nonstop: true)
flight14 = airline1.flights.create(destination: 'Washington DC', flight_number: 14, nonstop: false)
flight21 = airline2.flights.create(destination: 'Cleveland', flight_number: 21, nonstop: true)
flight22 = airline2.flights.create(destination: 'New Orleans', flight_number: 22, nonstop: true)
flight23 = airline2.flights.create(destination: 'Nashville', flight_number: 23, nonstop: true)
flight24 = airline2.flights.create(destination: 'Indianapolis', flight_number: 24, nonstop: true)
flight31 = airline3.flights.create(destination: 'Chicago', flight_number: 31, nonstop: true)
flight32 = airline3.flights.create(destination: 'Kansas City', flight_number: 32, nonstop: true)
flight33 = airline3.flights.create(destination: 'Minneapolis', flight_number: 33, nonstop: true)
flight34 = airline3.flights.create(destination: 'Omaha', flight_number: 34, nonstop: true)
flight41 = airline4.flights.create(destination: 'Las Vegas', flight_number: 41, nonstop: true)
flight42 = airline4.flights.create(destination: 'Seattle', flight_number: 42, nonstop: true)
flight43 = airline4.flights.create(destination: 'San Francisco', flight_number: 43, nonstop: true)
flight44 = airline4.flights.create(destination: 'Los Angelos', flight_number: 44, nonstop: true)
