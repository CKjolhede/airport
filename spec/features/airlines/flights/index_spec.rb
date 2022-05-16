require 'rails_helper'

RSpec.describe 'Airline_flights', type: :feature do
  context 'index content' do
    it 'shows all the flights associated with the airline' do

      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      flight12 = airline1.flights.create!(destination: 'New York', flight_number: 12, nonstop: false)

      airline2 = Airline.create!(name: 'Conurbation Airlines', on_time: false, rating: 4)
      flight21 = airline2.flights.create!(destination: 'Cleveland', flight_number: 21, nonstop: true)
      flight22 = airline2.flights.create!(destination: 'New Orleans', flight_number: 22, nonstop: true)

      visit "/airlines/#{airline1.id}/flights"
        save_and_open_page
      airline_flights = airline1.flights
      airline_flights.each do |flight|
        within ("#Flight-#{flight.id}") do
          expect(page).to have_content("Flight #{flight.id}")
          expect(page).to have_content("#{flight.destination}")
          expect(page).to have_content("#{flight.nonstop}")
          expect(page).to_not have_content('Cleveland' || 'New Orleans')
          expect(page).to_not have_content('Flight 21' || 'Flight 22')
        end
      end    
    end
  end
end
