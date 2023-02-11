class PetFormsController < ApplicationController
  def create
    @form = Form.find(params[:id])
    @pet = Pet.find(params[:pet_id])
    @pet_forms= PetForm.create(pet: @pet, form: @form)
    @pet_forms.save
    redirect_to "/forms/#{@form.id}"
  end

  
end