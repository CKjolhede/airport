require 'rails_helper'

RSpec.describe Airline, type: :feature do
  describe 'New Airline Form' do
    it 'renders the new form' do
      visit '/airlines/new'

      expect(page).to have_content('New Airline Record')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('On Time')
      expect(find('form')).to have_content('Rating')
    end

    it 'creates the new Airline record' do
      visit '/airlines/new'

      fill_in 'Name', with: 'New Airline'
      fill_in 'On Time', with: 'true'
      fill_in 'Rating', with: '1'

      click_on 'Save'
      
      expect(current_path).to be('/airlines')
      expect(page).to have_content('New Airline')
    end
  end
end
