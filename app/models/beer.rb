class Beer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :users

  # validates :name, presence: true
  # validates :brewery, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :type, presence: true
  # validates :abv, presence: true
  # validates :price, presence: true
  # validates :pairing, presence: true

end
