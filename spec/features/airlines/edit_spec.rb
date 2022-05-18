RSpec.describe "Edit Airline" do
  xit "can update an airline" do
          airline1 = Airline.create!(name: 'Alpha Air Lines', on_time: false, rating: 2)

    visit '/airlines'

    expect(page).to have_conent('Beta Air Lines')

    click_link "Edit"

    expect (current_path).to eq("/.airlines/.#{airline1.id}/edit")

  end
end
