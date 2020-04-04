class BookmarksController < ApplicationController
  respond_to :js, :json, :html
  def update
    @beer = Beer.find(params[:beer])
    @user = current_user
    bookmark = Bookmark.where(beer: @beer,user: @user)
    if bookmark == []
      # Create Bookmark
      Bookmark.create(beer: Beer.find(params[:beer]), user: current_user)
      @bookmark_exists = true
    else
      # Delete Bookmark
      bookmark.destroy_all
      @bookmark_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
