require 'rails_helper'

RSpec.describe 'Application page', type: :feature do
  describe 'as a visitor' do
    before :each do
      @shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
      @pet_1 = Pet.create!(adoptable: true, age: 1, breed: "Great Dane", shelter_id: @shelter_1.id, name: 'Scooby')
      @app_1 = Application.create!(name: "John Smith", street_address: "123 Main St.", city: "Denver", state: "CO", zip_code: 80202, description: "I want a pet.", status: "Accepted")
    end
    describe 'When I visit an applications show page' do
      it "Then I can see the following:
      - Name of the Applicant
      - Full Address of the Applicant including street address, city, state, and zip code
      - Description of why the applicant says they'd be a good home for this pet(s)
      - names of all pets that this application is for (all names of pets should be links to their show page)
      - The Application's status, either In Progress, Pending, Accepted, or Rejected" do
  
        visit "/applications/#{@app_1.id}"
        
        expect(current_path).to eq("/applications/#{@app_1.id}")
        expect(page).to have_content("Name of Applicant")
        expect(page).to have_content("Street Address")
        expect(page).to have_content("City")
        expect(page).to have_content("State")
        expect(page).to have_content("Zip Code")
        expect(page).to have_content("Description")
        expect(page).to have_content("Names of Pets")
        expect(page).to have_content("Application Status")
      end
    end
  end
  
end