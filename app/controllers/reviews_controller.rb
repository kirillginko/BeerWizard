class ReviewsController < ApplicationController

  def create
    @beer = Beer.find(params[:beer_id])
    @review = Review.new(review_params)
    @review.beer = @beer
    @review.user = current_user
    if @beer.save
      redirect_to beer_path(@beer)
    else
      render 'beers/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :likes, :stars)
  end
end
