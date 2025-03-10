class Form < ApplicationRecord
  has_many :pet_forms
  has_many :pets, through: :pet_forms

  enum status: ["In Progress", "Pending", "Accepted", "Rejected"] 
  validates :name, :street_address, :city, :state, presence: true
  validates :zip_code, presence: true, numericality: true
end