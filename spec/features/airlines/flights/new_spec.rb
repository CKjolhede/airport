require 'rails_helper'

RSpec.describe Flight, type: :feature do
  describe 'New Flight Form' do
    it 'renders the new form' do
      airline=Airline.create(name: "Airline", on_time: true, rating: 3)
      visit "/airlines/#{airline.id}/flights/new"
      within ("#new_airline_flight_form") do
      expect(page).to have_content('Create New Flight')
      expect(find('form')).to have_content("Flight Number")
      expect(find('form')).to have_content('This is a non-stop flight')
      expect(find('form')).to have_content('Destination')
      end
    end

    it 'creates the new Airline Flightrecord' do
      airline=Airline.create(name: "Airline", on_time: true, rating: 3)

     visit "/airlines/#{airline.id}/flights/new"

      fill_in 'Destination', with: 'Colorado Springs'
      select 'True', from: :nonstop
      fill_in 'Flight Number', with: '22'

      click_on 'Create Flight'
      expect(current_path).to eq("/airlines/#{airline.id}/flights")
      expect(page).to have_content("Colorado Springs")
save_and_open_page
    end
  end
end
