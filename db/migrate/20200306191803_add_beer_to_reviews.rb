class AddBeerToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :beer, foreign_key: true
  end
end
