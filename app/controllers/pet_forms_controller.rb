class PetFormsController < ApplicationController
  def create
    form = Form.find(params[:id])
    pet = Pet.find(params[:pet_id])
    pet_form = PetForm.create(pet: pet, form: form)
   
    redirect_to "/forms/#{form.id}"
  end
end