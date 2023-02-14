# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
shelter_2 = Shelter.create!(foster_program: true, name: "The Humane Society", city: "Loveland", rank: 1)
shelter_3 = Shelter.create!(foster_program: true, name: "Animal House", city: "Denver", rank: 13)
pet_1 = shelter_1.pets.create!(adoptable: true, age: 1, breed: "Great Dane", name: 'Scooby')
pet_2 = shelter_2.pets.create!(adoptable: true, age: 12, breed: "Labrador", name: 'Fido')
pet_3 = shelter_1.pets.create!(adoptable: true, age: 8, breed: "Dalmation", name: 'Spot')
pet_4 = shelter_1.pets.create!(adoptable: true, age: 4, breed: "Rough Collie", name: 'Lassie')
pet_5 = shelter_2.pets.create!(adoptable: true, age: 2, breed: "German Shepherd", name: 'Pickles')
pet_6 = shelter_2.pets.create!(adoptable: true, age: 4, breed: "Rottweiler", name: 'Chelsea')
pet_7 = shelter_2.pets.create!(adoptable: true, age: 3, breed: "Pomeranian", name: 'Fuzz Ball')
pet_8 = shelter_2.pets.create!(adoptable: true, age: 9, breed: "Pit Bull", name: 'Max')
pet_9 = shelter_2.pets.create!(adoptable: true, age: 7, breed: "Golden Retriever", name: 'Theo')

