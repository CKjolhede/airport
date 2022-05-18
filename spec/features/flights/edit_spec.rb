require 'rails_helper'

RSpec.describe Flight, type: :feature do
  context 'edit page form' do
    it 'has a field for each parameter' do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      
      visit "/flights/#{flight11.id}/edit"

        expect(page).to have_content('Update Flight')
        expect(find('form')).to have_content("Flight Number")
        expect(find('form')).to have_content('This is a non-stop flight')
        expect(find('form')).to have_content('Destination')
    end
    
    it "can update an airline" do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      flight11 = airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      
      visit "/flights/#{flight11.id}/edit"

      fill_in "Flight Number", with: 500
      select "True", from: :nonstop
      fill_in "Destination", with: "Toledo"

      click_on "Update Flight"
    
      expect(current_path).to eq("/flights/#{flight11.id}")
      save_and_open_page
      expect(page).to have_content('Flight 500')
      expect(page).to have_content('true')
      expect(page).to have_content('Toledo')      
    end
  end
end