class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :stars
      t.integer :likes
      t.references :user, foreign_key: true
      t.references :beer, foreign_key: true
      t.timestamps
    end
  end
end
