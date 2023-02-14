class Admin::FormsController < ApplicationController
  def show
    @form = Form.find(params[:id])
    @pets = @form.pets
  end

  def update
    form = Form.find(params[:id])
    form.update(status: params[:status])
   
    redirect_to "/admin/forms/#{form.id}"
  end
end