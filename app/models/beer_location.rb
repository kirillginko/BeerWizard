class BeerLocation < ApplicationRecord
  has_many :beers
  has_many :locations
end
