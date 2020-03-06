class BeersController < ApplicationController
  before_action :find_beer, only: [:show]

  def index
    @beers.all
  end

  def show
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :description, :location, :type, :abv, :price, :pairing)
  end

  def find_beer
    @beer = Beer.find(params[:id])
  end
end

