class AddLocationToBeerLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :beer_locations, :location, foreign_key: true
  end
end
