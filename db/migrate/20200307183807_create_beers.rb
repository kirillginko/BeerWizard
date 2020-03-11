class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :location
      t.string :description
      t.string :type
      t.string :abv
      t.string :price
      t.string :pairing
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
