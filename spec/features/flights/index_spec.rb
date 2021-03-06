require 'rails_helper'

RSpec.describe Flight, type: :feature do
  context 'index page' do
    it 'shows every flight in the database with its attributes' do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      flight12 = airline1.flights.create!(destination: 'New York', flight_number: 12, nonstop: false)
      flight13 = airline1.flights.create!(destination: 'Atlanta', flight_number: 13, nonstop: true)
      flight14 = airline1.flights.create!(destination: 'Washington DC', flight_number: 14, nonstop: false)

      airline2 = Airline.create!(name: 'Conurbation Airlines', on_time: false, rating: 4)
      flight21 = airline2.flights.create!(destination: 'Cleveland', flight_number: 21, nonstop: true)
      flight22 = airline2.flights.create!(destination: 'New Orleans', flight_number: 22, nonstop: true)
      flight23 = airline2.flights.create!(destination: 'Nashville', flight_number: 23, nonstop: true)
      flight24 = airline2.flights.create!(destination: 'Indianapois', flight_number: 24, nonstop: true)

      airline3 = Airline.create!(name: 'North East Airlines', rating: 7)
      flight31 = airline3.flights.create!(destination: 'Chicago', flight_number: 31, nonstop: true)
      flight32 = airline3.flights.create!(destination: 'Kansas City', flight_number: 32, nonstop: true)
      flight33 = airline3.flights.create!(destination: 'Minneapolis', flight_number: 33, nonstop: true)
      flight34 = airline3.flights.create!(destination: 'Omaha', flight_number: 34, nonstop: true)

      airline4 = Airline.create!(name: 'Divided Airlines', rating: 5)
      flight41 = airline4.flights.create!(destination: 'Las Vegas', flight_number: 41, nonstop: true)
      flight42 = airline4.flights.create!(destination: 'Seattle', flight_number: 42, nonstop: true)
      flight43 = airline4.flights.create!(destination: 'San Francisco', flight_number: 43, nonstop: true)
      flight44 = airline4.flights.create!(destination: 'Los Angelos', flight_number: 44, nonstop: true)

      visit '/flights'
      
      flights = Flight.all
      flights.each do |flight|
        within("#flight-#{flight.id}")
        expect(page).to have_content("Flight #{flight.id}")
        expect(page).to have_content(flight.destination.to_s)
        expect(page).to have_content(flight.airline.name.to_s)
        expect(page).to have_content(flight.nonstop.to_s)
        expect(page).to have_content("Update Flight")
        expect(page).to have_content("Delete Flight")
      end
    end
    
    it 'has a link to nonstop flights only' do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      flight12 = airline1.flights.create!(destination: 'New York', flight_number: 12, nonstop: false)
      
      airline2 = Airline.create!(name: 'Conurbation Airlines', on_time: false, rating: 4)
      flight21 = airline2.flights.create!(destination: 'Cleveland', flight_number: 21, nonstop: true)
      visit '/flights'
      
      click_on "Nonstop Flights Only"
      expect(current_path).to eq("/flights/nonstop")
      expect(page).to have_content("Miami")
      expect(page).to have_content("Cleveland")
      expect(page).to_not have_content("New York")
    end

    it "delete button removes the flight" do
      airline4 = Airline.create!(name: 'Divided Airlines', rating: 5)
      flight41 = airline4.flights.create!(destination: 'Las Vegas', flight_number: 41, nonstop: true)
      flight42 = airline4.flights.create!(destination: 'Seattle', flight_number: 42, nonstop: true)
      
      visit '/flights'

      within("#flight-#{flight41.id}")
        click_on "Delete Flight #{flight41.flight_number}"
      expect(current_path).to eq('/flights')
      expect(page).to_not have_content("Las Vegas")
      expect(page).to have_content("Seattle")
    end
  end
end
