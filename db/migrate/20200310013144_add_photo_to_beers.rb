class AddPhotoToBeers < ActiveRecord::Migration[5.2]
  def change
  add_column :beers, :photo, :string
  end
end
