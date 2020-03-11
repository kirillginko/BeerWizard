class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer
  validates :description, length: { minimum: 20}
  validates :stars, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5]}
end
