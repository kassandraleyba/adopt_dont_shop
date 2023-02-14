require 'rails_helper'

RSpec.describe 'Form page', type: :feature do
  describe 'as a visitor' do
    before :each do
      @shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
      @pet_1 = Pet.create!(adoptable: true, age: 1, breed: "Great Dane", shelter_id: @shelter_1.id, name: 'Scooby')
      @app_1 = Form.create!(name: "John Smith", street_address: "123 Main St.", city: "Denver", state: "CO", zip_code: 80202)
      # @pet_form_1 = PetForm.create!(pet_id: @pet_1.id, form_id: @app_1.id)
    end
    describe 'When I visit a forms show page' do
      it "Then I can see the following:
      - Name of the Applicant
      - Full Address of the Applicant including street address, city, state, and zip code
      - Description of why the applicant says they'd be a good home for this pet(s)
      - names of all pets that this application is for (all names of pets should be links to their show page)
      - The Application's status, either In Progress, Pending, Accepted, or Rejected" do
  
        visit "/forms/#{@app_1.id}"
        
        expect(current_path).to eq("/forms/#{@app_1.id}")
        expect(page).to have_content("Name of Applicant")
        expect(page).to have_content("Street Address")
        expect(page).to have_content("City")
        expect(page).to have_content("State")
        expect(page).to have_content("Zip Code")
        expect(page).to have_content("Names of Pets")
        expect(page).to have_content("Application Status")
      end
    end

    # 4. Searching for Pets for an Application

    describe 'When I visit an applications show page And that application has not been submitted' do
      describe 'Then I see a section on the page to "Add a Pet to this Application"' do
        it 'In that section I see an input where I can search for Pets by name' do
          visit "forms/#{@app_1.id}"
         
          fill_in :search, with: "Scooby"
         
          click_button "Pet Submit"
          
          expect(current_path).to eq("/forms/#{@app_1.id}")  
          expect(page).to have_content("Scooby")
        end
        
        it "Then next to each Pet's name I see a button to 'Adopt this Pet' When I click one of these buttons. Then I am taken back to the application show page And I see the Pet I want to adopt listed on this application" do
          visit "forms/#{@app_1.id}"
          
          fill_in :search, with: "Scooby"
          click_button "Pet Submit"
          
          expect(page).to have_button('Adopt this Pet')

          click_button "Adopt this Pet"

          expect(current_path).to eq("/forms/#{@app_1.id}")
          expect(page).to have_content("Names of Pets: Scooby")
        end
      end
    end

    # 6. Submit an Application

      describe 'And I click a button to submit this application,And I see an indicator that the application is "Pending"' do
        before do
        PetForm.create!(pet_id: @pet_1.id, form_id: @app_1.id)
        end

      it 'And I do not see a section to add more pets to this application' do
        visit "/forms/#{@app_1.id}"

        fill_in :description, with: "I want a pet."

        click_button "Submit Application"

        expect(page).to have_content("Pending")
        expect(page).to have_content("Scooby")
        expect(page).to_not have_content("Add A Pet To This Application")
        expect(page).to_not have_button("Submit Application")
      end
    end

   # 7. No Pets on an Application

    describe "And I have not added any pets to the application." do
      it 'Then I do not see a section to sumbit my app.' do
        visit "/forms/#{@app_1.id}"

        expect(page).to_not have_content("Description")
        expect(page).to_not have_button("Submit Application")
      end
    end

    # 8. Partial Matches for Pet Names

    describe "Then I see any pet whose name PARTIALLY matches my search" do
      it 'For example, if I search for "fluff", my search would match pets with names "fluffy", "fluff", and "mr. fluff"' do
        visit "/forms/#{@app_1.id}"

        fill_in :search, with: "Scooby"
        click_button "Pet Submit"

        expect(page).to have_content("Scooby")

        fill_in :search, with: "scooby"
        click_button "Pet Submit"

        expect(page).to have_content("Scooby")

        fill_in :search, with: "scoo"
        click_button "Pet Submit"

        expect(page).to have_content("Scooby")
      end
    end

    # 9. Case Insensitive Matches for Pet Names

    describe "Then my search is case insensitive" do
      it 'For example, if I search for "fluff", my search would match pets with names "Fluffy", "FLUFF", and "Mr. FlUfF"' do
        visit "/forms/#{@app_1.id}"

        fill_in :search, with: "ScooBy"
        click_button "Pet Submit"

        expect(page).to have_content("Scooby")

        fill_in :search, with: "Scooby"
        click_button "Pet Submit"

        expect(page).to have_content("Scooby")

        fill_in :search, with: "SCOOBY"
        click_button "Pet Submit"

        expect(page).to have_content("Scooby")
      end
    end
  end
end