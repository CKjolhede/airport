# flight_spec

require 'rails_helper'

RSpec.describe Flight, type: :model do
    describe 'validations' do
      it { should validate_presence_of :flight_number}
      it { should validate_presence_of :destination }
      it { should validate_presence_of :nonstop }
    end
    
    describe 'relationship' do
        it { should belong_to :airline }
    end


end
