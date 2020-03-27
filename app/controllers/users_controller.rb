class UsersController < ApplicationController
  respond_to :html, :js

  def index
    if params[:query].present?
    @users = User.search_title(params[:query])

    else
    @users = User.all.order("created_at DESC")
  end
end


  def show
    @user = User.find(params[:id])
  end
end
