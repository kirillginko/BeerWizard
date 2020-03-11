class CreateBeerLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_locations do |t|
      t.references :location, foreign_key: true
      t.references :beer, foreign_key: true
      t.timestamps
    end
  end
end
