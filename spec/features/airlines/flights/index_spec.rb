require 'rails_helper'

RSpec.describe 'Airline flights', type: :feature do
  context 'index content' do
    it 'shows all the flights associated with the airline' do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      flight12 = airline1.flights.create!(destination: 'New York', flight_number: 12, nonstop: false)

      airline2 = Airline.create!(name: 'Conurbation Airlines', on_time: false, rating: 4)
      flight21 = airline2.flights.create!(destination: 'Cleveland', flight_number: 21, nonstop: true)
      flight22 = airline2.flights.create!(destination: 'New Orleans', flight_number: 22, nonstop: true)

      visit "/airlines/#{airline1.id}/flights"

      within '#flight11' do
        expect(page).to have_content('Miami')
        expect(page).to have_content('Flight Number: 11')
        expect(page).to have_content('Nonstop')
        expect(page).to_not have_content('Cleveland')
        expect(page).to_not have_content('New York')
        expect(page).to_not have_content('Flight Number: 21')
      end

      within '#flight12' do
        expect(page).to have_content('New York')
        expect(page).to have_content('Flight Number: 12')
        expect(page).to have_content('Nonstop = false')
        expect(page).to_not have_content('New Orleans')
        expect(page).to_not have_content('Miami')
        expect(page).to_not have_content('Flight Number: 22')
      end
    end
  end
end
