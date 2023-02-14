require 'rails_helper'

RSpec.describe 'Admin/Forms Show Page' do
  describe 'When I visit an admin application show page (/admin/forms/:id)' do
    before :each do
      @shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
      @pet_1 = Pet.create!(adoptable: true, age: 1, breed: "Great Dane", shelter_id: @shelter_1.id, name: 'Scooby')
      @app_1 = Form.create!(name: "John Smith", street_address: "123 Main St.", city: "Denver", state: "CO", zip_code: 80202, status: 1)
      @pet_form_1 = PetForm.create!(pet_id: @pet_1.id, form_id: @app_1.id)
    end

    # 12. Approving a Pet for Adoption

    describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
      describe "When I click that button, Then I'm taken back to the admin application show page" do
        it "And next to the pet that I approved, I see an indicator next to the pet that they have been approved" do
          visit "/admin/forms/#{@app_1.id}"

          expect(page).to have_button("Approve Application")

          click_button "Approve Application"

          expect(current_path).to eq("/admin/forms/#{@app_1.id}")
          expect(page).to have_content("#{@pet_1.name}'s application has been successfully accepted!!")
        end
      end  
    end
  end
end