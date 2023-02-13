class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.all.reverse_alphabetical
    @pending_app = Shelter.pending_app
  end
end