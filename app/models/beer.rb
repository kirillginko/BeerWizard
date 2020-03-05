class Beer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users

  # validates :name, presence: true
  # validates :brewery, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :type, presence: true
  # validates :abv, presence: true
  # validates :price, presence: true
  # validates :pairing, presence: true

end
