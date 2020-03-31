class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_beer, only: [:show, :update, :edit, :vote]
  respond_to :js, :json, :html

  def index
    if params[:query].present?
    @beers = Beer.search_title(params[:query])
    else
    @beers = Beer.all.order("name ASC")
  end
end

  def show
    @review = Review.new
    @bookmark_exists = Bookmark.where(beer: @beer, user: current_user) == [] ? false : true
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
