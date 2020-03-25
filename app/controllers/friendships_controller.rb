class FriendshipsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user
  respond_to :html, :js

  def create
    current_user.follow(@user)
    p @user
    respond_to do |format|
    format.html { redirect_to @user }
    format.js {render :action => "follow_button"}
  end
end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
    format.html { redirect_to @user }
    format.js {render :action => "follow_button"}
  end
end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
