class ReviewsController < ApplicationController

  def create
    @beer = Beer.find(params[:beer_id])
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

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:description, :likes, :stars)
  end
end
