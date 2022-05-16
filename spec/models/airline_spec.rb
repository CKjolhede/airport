require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :rating }
  end

  describe 'relationships' do
    it { should have_many :flights }
  end

  describe 'class method' do
    it 'puts airlines in ascending order by creation date' do
      airline2 = Airline.create!(name: 'Conurbation Airlines', rating: 1)
      sleep 1
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: 'true', rating: 2)
      sleep 1
      airline4 = Airline.create!(name: 'Divided Airlines', rating: 7)
      sleep 1
      airline3 = Airline.create!(name: 'North East Airlines', on_time: 0, rating: 8)
      expect(Airline.sort_by_creation).to eq([airline2, airline1, airline4, airline3])
    end
  end

  describe 'instance methods' do
    it 'can count the number of flights associated with an airline' do
      airline1 = Airline.create(name: 'Alpha Air Lines', on_time: 'true', rating: 2)
      flight11 = airline1.flights.create(destination: 'Miami', flight_number: 11, nonstop: true)
      flight12 = airline1.flights.create(destination: 'New York', flight_number: 12, nonstop: false)
      flight13 = airline1.flights.create(destination: 'Atlanta', flight_number: 13, nonstop: true)
      flight14 = airline1.flights.create(destination: 'Washington DC', flight_number: 14, nonstop: false)

      expect(airline1.flights_count).to eq(4)
    end
  end
end
