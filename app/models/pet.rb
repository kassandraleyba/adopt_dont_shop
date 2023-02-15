class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  belongs_to :shelter
  has_many :pet_forms, 
  has_many :forms, through: :pet_forms


  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def approved(form_id)
    pet_forms.where(form_id: form_id).first.pet_status
  end
end
