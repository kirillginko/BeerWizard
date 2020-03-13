class ReviewsController < ApplicationController
  before_action :find_beer


  def create
    @review = Review.new(review_params)
    @review.beer = @beer
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to beer_path(@beer) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'beers/show' }
        format.js
      end
    end
  end

  def edit
  @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to beer_path(@beer)
    else
      render 'edit'
  end
end

  def destroy
  @review = Review.find(params[:id])
  @review.destroy
  redirect_to beer_path(@beer)
  end

  private

  def review_params
    params.require(:review).permit(:description, :likes, :stars)
  end
end

  def find_beer
    @beer = Beer.find(params[:beer_id])
  end

