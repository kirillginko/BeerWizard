class AddBeerToBeerLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :beer_locations, :beer, foreign_key: true
  end
end
