require 'rails_helper'

RSpec.describe Airline, type: :feature do
  describe 'Airlines Show' do
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
      expect(page).to have_content('Airline Rating = 7')
    end
  end
end
