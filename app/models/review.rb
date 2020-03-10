class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :description, length: { minimum: 20}
end
