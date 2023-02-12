class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.all.reverse_alphabetical
  end
end