class FormsController < ApplicationController
  def show
    @form = Form.find(params[:id])
    if params[:search].present?
      @pet_search = Pet.search(params[:search])
    else params[:adopt] == "true"
      @pet_search = Pet.search(params[:adopt])
    # else
    #   @pet_search = []
    end
  end

  def new
  end

  def create
    form = Form.new(form_params)
    if form.valid?
      form.save
      redirect_to "/forms/#{form.id}"
    else 
      flash[:error] = form.errors.full_messages
      redirect_to "/forms/new"
    end
  end

  def update
    form = Form.find(params[:id])
    form.update(description: params[:description], status: 1)
    redirect_to "/forms/#{form.id}"
  end

  def form_params
    params.permit(:name, :street_address, :city, :state, :zip_code)
  end
end