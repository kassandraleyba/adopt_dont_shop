require 'rails_helper'

RSpec.describe PetForm, type: :model do
  describe "relationships" do
    it {should belong_to :pet}
    it {should belong_to :form}
    it {should define_enum_for(:pet_status).with_values(["Pending", "Approved", "Rejected"])}
  end

  describe "#instance methods" do
    before :each do
      @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
      @pet_3 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)
      @app_1 = Form.create!(name: "John Smith", street_address: "123 Main St.", city: "Denver", state: "CO", zip_code: 80202, description: "I want a pet.", status: 1)
      @pet_form_1 = PetForm.create!(pet_id: @pet_3.id, form_id: @app_1.id)
    end

    it "should find params" do
      expect(PetForm.find_params(@app_1.id, @pet_3.id)).to eq(@pet_form_1)
    end
  end
end