class Admin::FormsController < ApplicationController
  def show
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])
    pet_form = PetForm.find_params(params[:id], params[:pet_id])

    pet_form.update(pet_status: params[:status].to_i)
   
    redirect_to "/admin/forms/#{@form.id}"
  end
end