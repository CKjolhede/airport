require 'rails_helper'

RSpec.describe Airline, type: :feature do
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
end
