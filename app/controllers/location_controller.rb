class LocationController < ActionController::Base
  def show
    @location = Location.find(params[:id])
  end
end
