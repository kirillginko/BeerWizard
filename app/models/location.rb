class Location < ApplicationRecord
  has_many :beers, through: :beer_location
end
