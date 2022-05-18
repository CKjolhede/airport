require 'rails_helper'

RSpec.describe Airline, type: :feature do
  describe 'New Airline Form' do
    it 'renders the new form' do
      visit '/airlines/new'
    within ("#new_airline_form") do
      expect(page).to have_content('Create New Airline')
      expect(find('form')).to have_content("Airline's Name")
      expect(find('form')).to have_content('All flights currently on time')
      expect(find('form')).to have_content('Rating')
    end
    end

    it 'creates the new Airline record' do
      visit '/airlines/new'

      fill_in 'Name', with: 'New Airline'
      select 'True', from: :on_time
      fill_in 'Rating', with: '1'

      click_on 'Create Airline'
      expect(current_path).to eq('/airlines')
      expect(page).to have_content('New Airline')
    end
  end
end
