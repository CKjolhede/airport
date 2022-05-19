require 'rails_helper'

RSpec.describe Airline, type: :feature do
  describe 'index page' do
    it 'shows the name of each airline in the system' do
      @airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      @airline2 = Airline.create!(name: 'Conurbation Airlines', on_time: false, rating: 4)
      @airline3 = Airline.create!(name: 'North East Airlines', rating: 7)
      @airline4 = Airline.create!(name: 'Divided Airlines', rating: 5)
    visit '/airlines'

      expect(page).to have_content(@airline1.name)
      expect(page).to have_content(@airline2.name)
      expect(page).to have_content(@airline3.name)
      expect(page).to have_content(@airline4.name)
    end
    
    it 'shows the time each airline was created' do
      # sleep is to help differentiate between creation times
      airline2 = Airline.create!(name: 'Conurbation Airlines', rating: 1)
      sleep 0.2
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: 'true', rating: 2)
      sleep 0.2
      airline4 = Airline.create!(name: 'Divided Airlines', rating: 7)
      sleep 0.2
      airline3 = Airline.create!(name: 'North East Airlines', on_time: 0, rating: 8)

    visit '/airlines'
      
      expect(page).to have_content(airline1.created_at)
      expect(page).to have_content(airline2.created_at)
      expect(page).to have_content(airline3.created_at)
      expect(page).to have_content(airline4.created_at)
    end
  end

  describe 'sort airlines by ascending creation date' do
    it 'will display airlines in ascending order of creation date' do
      airline2 = Airline.create!(name: 'Conurbation Airlines', rating: 1)
      sleep 0.2
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: 'true', rating: 2)
      sleep 0.2
      airline4 = Airline.create!(name: 'Divided Airlines', rating: 7)
      sleep 0.2
      airline3 = Airline.create!(name: 'North East Airlines', on_time: 0, rating: 8)

      visit '/airlines'
          
      expect(airline2.name).to appear_before(airline1.name)
      expect(airline1.name).to appear_before(airline4.name)
      expect(airline4.name).to appear_before(airline3.name)
    end
  end

  describe 'New Airline Link' do
    it 'has a link to create a new airline' do
    visit '/airlines'
    click_button "Create a New Airline"
    expect(current_path).to eq('/airlines/new')
    end
  end

  describe 'Update Link' do
    it 'for every airline' do
      visit '/airlines'

      airlines = Airline.all
      airlines.each do |airline|
        within("#airline-#{airline.id}")
          expect(page).to have_content("Update Airline")
       end
    end
  end

  describe "delete link" do
    it 'has a delete link which deletes the airline' do
      @airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)
      @airline2 = Airline.create!(name: 'Conurbation Airlines', on_time: false, rating: 4)
      @airline3 = Airline.create!(name: 'North East Airlines', rating: 7)
      @airline4 = Airline.create!(name: 'Divided Airlines', rating: 5)

      visit '/airlines'
save_and_open_page
      airlines = Airline.all
      airlines.each do |airline|
      expect(page).to have_content("Delete #{airline.name}")
        end

      click_on "Delete #{@airline1.name}"

      expect(current_path).to eq('/airlines')
      expect(page).to_not have_content("Alpha Air Lines")
    end
  end
end