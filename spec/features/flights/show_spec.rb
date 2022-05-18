require 'rails_helper'

RSpec.describe Flight, type: :feature do
  context 'Show page content' do
    before(:each) do
      @airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      @flight11 = @airline1.flights.create!(destination: 'Miami', flight_number: 11, nonstop: true)
      
      visit "/flights/#{@flight11.id}"
    end

    it 'shows flight with flight id and all attributes' do
    
      within("#Flight") do
        expect(page).to have_content("Flight 11")
        expect(page).to have_content("Miami")
        expect(page).to have_content("#{@flight11.airline.name}")
        expect(page).to have_content("true")
      end
    end

    it 'has a link to Update Flight information' do
save_and_open_page
      click_on "Update Flight"

      expect(current_path).to eq("/flights/#{@flight11.id}/edit")
    end
  end
end
