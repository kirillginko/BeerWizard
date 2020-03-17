class BeersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_beer, only: [:show, :update, :edit, :vote]
  respond_to :js, :json, :html

  def index
    if params[:query].present?
      @beerquery =  "#" + params[:query]
      sql_query = " \
      beers.description @@ :query \
      OR beers.brewery @@ :query \
      OR beers.beer_type @@ :query \
      OR beers.style @@ :query \
      "
      @beers = Beer.where(sql_query, query: "%#{params[:query]}%")
    else
    @beers = Beer.all.order("created_at DESC")
    @users = User.all.order("created_at DESC")
  end
end

  def show
    @review = Review.new
    if @beer.reviews.blank?
      @average_review = 0
    else
      @average_review = @beer.reviews.average(:stars).round(2)
    end
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
