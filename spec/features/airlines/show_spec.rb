require 'rails_helper'

RSpec.describe Airline, type: :feature do
  describe 'Airlines Show' do
    context 'when on_time == false' do
      it 'shows the Airline id and all attributes' do
        airline1 = Airline.create(name: 'Alpha Air Lines', rating: 2)
        airline2 = Airline.create(name: 'Conurbation Airlines', rating: 4)
        airline3 = Airline.create(name: 'North East Airlines', rating: 7)
        airline4 = Airline.create(name: 'Divided Airlines', on_time: 'false', rating: 7)
        visit "/airlines/#{airline4.id}"

        expect(page).to have_content('Divided Airlines')
        expect(page).to_not have_content("Airline ID = #{airline1.id}")
        expect(page).to_not have_content("Airline ID = #{airline2.id}")
        expect(page).to_not have_content("Airline ID = #{airline3.id}")
        expect(page).to have_content("Airline ID = #{airline4.id}")
        expect(page).to_not have_content('On Time')
        expect(page).to have_content('Delays')
        expect(page).to have_content('Airline Rating = 7')
      end
    end

    context 'when on_time == true' do
      it 'shows the Airline id and all attributes' do
        airline1 = Airline.create(name: 'Alpha Air Lines', rating: 2)
        airline2 = Airline.create(name: 'Conurbation Airlines', rating: 4)
        airline3 = Airline.create(name: 'North East Airlines', rating: 7)
        airline4 = Airline.create(name: 'Divided Airlines', on_time: 'false', rating: 7)
        visit "/airlines/#{airline1.id}"

        expect(page).to have_content('Alpha Air Lines')
        expect(page).to have_content("Airline ID = #{airline1.id}")
        expect(page).to_not have_content("Airline ID = #{airline2.id}")
        expect(page).to_not have_content("Airline ID = #{airline3.id}")
        expect(page).to_not have_content("Airline ID = #{airline4.id}")
        expect(page).to have_content('On Time')
        expect(page).to_not have_content('Delays')
        expect(page).to have_content('Airline Rating = 2')
      end
    end

    context 'count of flights for airline' do
      it 'shows the number of flights associated with the airline' do
        airline1 = Airline.create(name: 'Alpha Air Lines', on_time: 'true', rating: 2)
        flight11 = airline1.flights.create(destination: 'Miami', flight_number: 11, nonstop: true)
        flight12 = airline1.flights.create(destination: 'New York', flight_number: 12, nonstop: false)
        flight13 = airline1.flights.create(destination: 'Atlanta', flight_number: 13, nonstop: true)
        flight14 = airline1.flights.create(destination: 'Washington DC', flight_number: 14, nonstop: false)
        flight21 = airline2.flights.create(destination: 'Cleveland', flight_number: 21, nonstop: true)

        expect(@airline.flights_count).to eq(4)
      end
    end
  end
end
