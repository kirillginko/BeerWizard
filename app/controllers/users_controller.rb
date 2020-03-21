class UsersController < ApplicationController

  def index
    if params[:query].present?
      @userquery =  "#" + params[:query]
      user_query = " \
      users.name @@ :query \
"
      @users = User.where(user_query, query: "%#{params[:query]}%")
    else
    @users = User.all.order("created_at DESC")
  end
end


  def show
    @user = User.find(params[:id])
  end
end
