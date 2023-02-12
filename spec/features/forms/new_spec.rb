require 'rails_helper'

RSpec.describe "create" do
  before :each do
    @shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
    @pet_1 = Pet.create!(adoptable: true, age: 1, breed: "Great Dane", shelter_id: @shelter_1.id, name: 'Scooby')
    # @app_1 = Form.create!(name: "John Smith", street_address: "123 Main St.", city: "Denver", state: "CO", zip_code: 80202, description: "I want a pet.", status: 0)
  end
  describe 'When I fill in this form with my info And I click submit' do
       # 2. Starting an Application
    it 'Then I am taken to the new applications show page' do
      visit '/forms/new'
  
      fill_in "Name:", with: "John Smith"
      fill_in "Street Address:", with: "123 Main St."
      fill_in "City:", with: "Denver"
      fill_in "State:", with: "CO"
      fill_in "Zip Code:", with: 80202
  
      click_button "Submit"

      application = Form.last
  
      expect(current_path).to eq("/forms/#{application.id}")
      expect(page).to have_content(application.name)
      expect(page).to have_content(application.street_address)
      expect(page).to have_content(application.city)
      expect(page).to have_content(application.state)
      expect(page).to have_content(application.zip_code)
      expect(page).to have_content(application.status)
    end
  end
  # 3. Starting an Application, Form not Completed
 
  describe "When I visit the new application page, And I fail to fill in any of the form fields " do
    it 'Then I am taken back to the new applications page and I see a message that I must fill in those fields.' do
      visit '/forms/new'
      
      fill_in "Name:", with: "John Smith"
      fill_in "Street Address:", with: "123 Main St."
      fill_in "City:", with: "Denver"
      fill_in "State:", with: "CO"

      click_button "Submit"

      expect(current_path).to eq("/forms/new")
      expect(page).to have_content("Zip code can't be blank")
    end
  end
end