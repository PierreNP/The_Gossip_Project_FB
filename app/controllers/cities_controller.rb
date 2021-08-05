class CitiesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    city = City.find(params[:id])

    nos_params = params.require(:id.to_s).permit(:name, :zip_code)
    

  end

  def update
  end

  def destroy
  end
end
