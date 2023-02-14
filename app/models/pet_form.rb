class PetForm < ApplicationRecord
  belongs_to :pet
  belongs_to :form
  enum pet_status: ["Pending", "Approved", "Rejected"]
end