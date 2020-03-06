class Location < ApplicationRecord
  belongs_to :beer, through: :beer_location
end
