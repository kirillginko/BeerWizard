class CreateBeerLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_locations do |t|

      t.timestamps
    end
  end
end
