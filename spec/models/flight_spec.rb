# flight_spec

require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it { should validate_presence_of :flight_number }
    it { should validate_presence_of :destination }
  end

  describe 'relationship' do
    it { should belong_to :airline }
  end

  describe 'class variables' do
    it '#nonstops sorts to only nonstop flights' do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      flight12 = airline1.flights.create!(destination: 'New York', flight_number: 12, nonstop: false)

        expect(Flight.nonstops).to eq([flight11])
    end

    it 'puts flights in alphabetical order by destination' do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      flight12 = airline1.flights.create!(destination: 'New York', flight_number: 12, nonstop: false)
      flight13 = airline1.flights.create!(destination: 'Atlanta', flight_number: 13, nonstop: true)
      flight14 = airline1.flights.create!(destination: 'Washington DC', flight_number: 14, nonstop: false)

    expect(Flight.alphabetized).to eq([flight13, flight11, flight12, flight14])
    end
  end
 end
