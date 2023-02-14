require 'rails_helper'

RSpec.describe PetForm, type: :model do
  describe "relationships" do
    it {should belong_to :pet}
    it {should belong_to :form}
    it {should define_enum_for(:pet_status).with_values(["Pending", "Approved", "Rejected"])}
  end
end