# airline_spec

require 'rails_helper'

RSpec.describe Airline, type: :model do
    describe 'validations' do
        it { should validate_presence_of :name}
        it { should validate_presence_of :delays}
        it { should validate_presence_of :rating}
    end

    describe 'relationships' do
        it {should have_mamy :flights}
    end
end
