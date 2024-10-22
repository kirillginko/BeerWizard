class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    if params[:query].present?
    @beers = Beer.search_title(params[:query])
    else
    @beers = Beer.all.order("name ASC")
  end
  @users = User.all.order("name Asc")
end
  @samples = Beer.all.limit(5)
end
