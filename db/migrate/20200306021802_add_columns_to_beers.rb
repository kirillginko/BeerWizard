class AddColumnsToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :brewery, :string
    add_column :beers, :location, :string
    add_column :beers, :description, :text
    add_column :beers, :type, :string
    add_column :beers, :abv, :string
    add_column :beers, :price, :float
    add_column :beers, :pairing, :text
  end
end
