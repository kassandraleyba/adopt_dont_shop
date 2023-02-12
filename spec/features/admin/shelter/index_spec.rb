require 'rails_helper'

# SQL Only Story

# For this story, you should write your queries in raw sql. You can use the ActiveRecord find_by_sql method to execute raw sql queries: https://guides.rubyonrails.org/active_record_querying.html#finding-by-sql

# 10. Admin Shelters Index

# As a visitor
# When I visit the admin shelter index ('/admin/shelters')
# Then I see all Shelters in the system listed in reverse alphabetical order by name

RSpec.describe 'Admin/Shelter Page' do
  describe 'When I visit the admin shelter index (/admin/shelters)' do
    before :each do
      @shelter_1 = Shelter.create!(foster_program: false, name: "The Farm", city: "Denver", rank: 2)
      @shelter_2 = Shelter.create!(foster_program: false, name: "Pet Place", city: "Denver", rank: 2)
      @shelter_3 = Shelter.create!(foster_program: false, name: "Animal House", city: "Denver", rank: 2)
    end
  
    it 'Then I see all Shelters in the system listed in reverse alphabetical order by name' do
      visit '/admin/shelters'

      # save_and_open_page
      expect(@shelter_1.name).to appear_before(@shelter_2.name)
      expect(@shelter_2.name).to appear_before(@shelter_3.name)
      expect(@shelter_3.name).to_not appear_before([@shelter_3.name, @shelter_2.name])
    end
  end
end