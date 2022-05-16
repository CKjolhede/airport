require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :rating }
  end

  describe 'relationships' do
    it { should have_many :flights }
  end

  describe 'class variable' do
    it 'puts airlines in descending order by creation date' do
      airline2 = Airline.create!(name: 'Conurbation Airlines', rating: 1)
      sleep 1
      airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: 'true', rating: 2)
      sleep 1
      airline4 = Airline.create!(name: 'Divided Airlines', rating: 7)
      sleep 1
      airline3 = Airline.create!(name: 'North East Airlines', on_time: 0, rating: 8)
      expect(Airline.in_order).to eq([airline2, airline1, airline4, airline3])
    end
  end
end
