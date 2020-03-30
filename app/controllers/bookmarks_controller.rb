class BookmarksController < ApplicationController
  respond_to :js, :json, :html
  def update
    bookmark = Bookmark.where(beer: Beer.find(params[:beer]), user: current_user)
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
