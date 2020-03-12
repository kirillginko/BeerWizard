class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :update, :vote]
  before_action :find_beer, only: [:show, :update, :edit, :vote]
  respond_to :js, :json, :html

  def index
    @beers = Beer.all
    @users = User.all
  end

  def show
    @review = Review.new
  end

  def edit; end

  def vote
    if !current_user.liked? @beer
      @beer.liked_by current_user
    elsif current_user.liked? @beer
      @beer.unliked_by current_user
    end
  end

  def update
    if @beer.update(beer_params)
      redirect_to @beer, notice: "Beer was updated!"
    else
      render :edit
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :description, :location, :type, :abv, :price, :pairing, :photo, :avatar)
  end

  def find_beer
    @beer = Beer.find(params[:id])
  end
end
