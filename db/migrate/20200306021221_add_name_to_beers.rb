class AddNameToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :name, :string
  end
end
