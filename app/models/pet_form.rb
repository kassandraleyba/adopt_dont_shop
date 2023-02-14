class PetForm < ApplicationRecord
  belongs_to :pet
  belongs_to :form
  enum pet_status: ["Pending", "Approved", "Rejected"]

  def self.find_params(form_id, pet_id)
    where(form_id: form_id, pet_id: pet_id).first
  end
end