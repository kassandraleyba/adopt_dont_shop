require 'rails_helper'

RSpec.describe 'Admin/Forms Show Page' do
  describe 'When I visit an admin application show page (/admin/forms/:id)' do
    before :each do
      @shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
      @pet_1 = Pet.create!(adoptable: true, age: 1, breed: "Great Dane", shelter_id: @shelter_1.id, name: 'Scooby')
      @app_1 = Form.create!(name: "John Smith", street_address: "123 Main St.", city: "Denver", state: "CO", zip_code: 80202, status: 1)
      @app_2 = Form.create!(name: "Jim Smith", street_address: "123 Main St.", city: "Golden", state: "CO", zip_code: 80402, status: 1)
      @pet_form_1 = PetForm.create!(pet_id: @pet_1.id, form_id: @app_1.id)
      @pet_form_1 = PetForm.create!(pet_id: @pet_1.id, form_id: @app_2.id)
    end

    # 12. Approving a Pet for Adoption

    describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
      describe "When I click that button, Then I'm taken back to the admin application show page" do
        it "And next to the pet that I approved, I see an indicator next to the pet that they have been approved" do
          visit "/admin/forms/#{@app_1.id}"

          expect(page).to have_button("Approve Pet")

          click_button "Approve Pet"
        
          expect(current_path).to eq("/admin/forms/#{@app_1.id}")
          expect(page).to have_content("#{@pet_1.name} has been successfully accepted!!")
          expect(page).to_not have_button("Approve Pet")
        end
      end  
    end

    # 13. Rejecting a Pet for Adoption

    describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
      describe "When I click that button, Then I'm taken back to the admin application show page" do
        it "And next to the pet that I rejected, I see an indicator next to the pet that they have been rejected" do
          visit "/admin/forms/#{@app_1.id}"

          expect(page).to have_button("Reject Pet")

          click_button "Reject Pet"
        
          expect(current_path).to eq("/admin/forms/#{@app_1.id}")
          expect(page).to have_content("#{@pet_1.name} has been rejected.")
          expect(page).to_not have_button("Reject Pet")
          expect(page).to_not have_button("Approve Pet")
        end
      end  
    end

    # 14. Approved/Rejected Pets on one Application do not affect other Applications

    describe "When there are two applications in the system for the same pet" do
      describe "When I visit the admin application show page for one of the applications and I approve or reject the pet for that application When I visit the other application's admin show page then I do not see that the pet has been accepted or rejected for that application" do
        it "And instead I see buttons to approve or reject the pet for this specific application" do

          visit "/admin/forms/#{@app_1.id}"
          click_button "Reject Pet"
          expect(current_path).to eq("/admin/forms/#{@app_1.id}")

          visit "/admin/forms/#{@app_2.id}"
          
          expect(page).to have_button("Approve Pet")
          expect(page).to have_button("Reject Pet")
        end
      end  
    end
  end
end