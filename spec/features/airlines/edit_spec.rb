require 'rails_helper'

RSpec.describe Airline, type: :feature do
  context 'edit page form' do
    it 'has a field for each parameter' do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: 'false', rating: 2)
      
      visit "/airlines/#{airline1.id}/edit"

      within("#edit_airline_form") do
        expect(page).to have_content('Update Airline')
        expect(find('form')).to have_content("Airline's Name")
        expect(find('form')).to have_content('All flights currently on time')
        expect(find('form')).to have_content('Rating')
      end
    end
    
    it "can update an airline" do
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)

      visit "/airlines/#{airline1.id}/edit"

      fill_in "Airline's Name", with: "Beta Air Lines"
      select "False", from: :on_time
      fill_in "Rating", with: "5"

      click_on "Update Airline"
    
      expect(current_path).to eq("/airlines/#{airline1.id}")
      
      expect(page).to have_content('Beta Air Lines')
      expect(page).to have_content('All Flights On Time')
      expect(page).to have_content('5')
      expect(page).to have_content("Total Number of Flights: 0")
      
    end
  end
end
