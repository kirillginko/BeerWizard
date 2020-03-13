class AddIbuToBeers < ActiveRecord::Migration[5.2]
  def change
      add_column :beers, :ibu, :string
  end
end
