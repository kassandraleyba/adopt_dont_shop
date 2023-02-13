# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
shelter_2 = Shelter.create!(foster_program: true, name: "The Humane Society", city: "Loveland", rank: 1)
pet_1 = shelter_1.pets.create!(adoptable: true, age: 1, breed: "Great Dane", name: 'Scooby', )
pet_2 = shelter_2.pets.create!(adoptable: true, age: 12, breed: "Great Dane", name: 'Fido', )
app_1 = Form.create!(name: "John Smith", street_address: "123 Main St.", city: "Denver", state: "CO", zip_code: 80202, description:"I want a pet.", status: 1)
